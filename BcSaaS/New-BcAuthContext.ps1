﻿<# 
 .Synopsis
  Preview function for creating new BC Auth Context
 .Description
  Preview function for creating new BC Auth Context
#>
function New-BcAuthContext {
    Param(
        [string] $clientID = "1950a258-227b-4e31-a9cf-717495945fc2",
        [string] $Resource = "https://api.businesscentral.dynamics.com/",
        [string] $tenantID = "Common",
        [string] $authority = "https://login.microsoftonline.com/$TenantID",
        [string] $refreshToken,
        [string] $scopes = "https://api.businesscentral.dynamics.com/.default",
        [SecureString] $clientSecret,
        [PSCredential] $credential,
        [switch] $includeDeviceLogin,
        [Timespan] $deviceLoginTimeout = [TimeSpan]::FromMinutes(5)
    )

    $authContext = @{
        "clientID"           = $clientID
        "Resource"           = $Resource
        "tenantID"           = $tenantID
        "authority"          = $authority
        "includeDeviceLogin" = $includeDeviceLogin
        "deviceLoginTimeout" = $deviceLoginTimeout
    }
    $subject = "$($Resource.TrimEnd('/'))/$tenantID"
    $accessToken = $null
    if ($clientSecret) {
        $TokenRequestParams = @{
            Method = 'POST'
            Uri    = "$($authority.TrimEnd('/'))/oauth2/v2.0/token"
            Body   = @{
                "grant_type"    = "client_credentials"
                "scope"         = $scopes
                "client_id"     = $clientId
                "client_secret" = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($clientSecret))
            }
        }
        try {
            Write-Host "Attempting authentication to $scopes using clientCredentials..."
            $TokenRequest = Invoke-RestMethod @TokenRequestParams -UseBasicParsing
            $global:TT = $TokenRequest
            $accessToken = $TokenRequest.access_token
            $jwtToken = Parse-JWTtoken -token $accessToken
            Write-Host -ForegroundColor Green "Authenticated as app $($jwtToken.appid)"

            try {
                $expiresOn = [Datetime]::new(1970,1,1).AddSeconds($jwtToken.exp)
            }
            catch {
                $expiresOn = [DateTime]::now.AddSeconds($TokenRequest)
            }

            $authContext += @{
                "AccessToken"  = $accessToken
                "UtcExpiresOn" = $expiresOn
                "RefreshToken" = $null
                "Credential"   = $null
                "ClientSecret" = $clientSecret
                "scopes"       = $scopes
            }

        }
        catch {
            $exception = $_.Exception
            Write-Host -ForegroundColor Red $exception.Message.Replace('{EmailHidden}',$credential.UserName)
            $accessToken = $null
        }
    }
    else {
        if ($credential) {
            $TokenRequestParams = @{
                Method = 'POST'
                Uri    = "$($authority.TrimEnd('/'))/oauth2/token"
                Body   = @{
                    "grant_type" = "password"
                    "client_id"  = $ClientId
                    "username"   = $credential.UserName
                    "password"   = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($credential.Password))
                    "resource"   = $Resource
                }
            }
            try {
                Write-Host "Attempting authentication to $subject using username/password..."
                $TokenRequest = Invoke-RestMethod @TokenRequestParams -UseBasicParsing
                $accessToken = $TokenRequest.access_token
                $jwtToken = Parse-JWTtoken -token $accessToken
                Write-Host -ForegroundColor Green "Authenticated from $($jwtToken.ipaddr) as user $($jwtToken.name) ($($jwtToken.upn))"
    
                $authContext += @{
                    "AccessToken"  = $accessToken
                    "UtcExpiresOn" = [Datetime]::new(1970,1,1).AddSeconds($TokenRequest.expires_on)
                    "RefreshToken" = $TokenRequest.refresh_token
                    "Credential"   = $credential
                    "ClientSecret" = $null
                    "scopes"       = ""
                }
            }
            catch {
                $exception = $_.Exception
                Write-Host -ForegroundColor Yellow $exception.Message.Replace('{EmailHidden}',$credential.UserName)
                $accessToken = $null
            }
        }
        if (!$accessToken -and $refreshToken) {
            $TokenRequestParams = @{
                Method = 'POST'
                Uri    = "$($authority.TrimEnd('/'))/oauth2/token"
                Body   = @{
                    "grant_type"    = "refresh_token"
                    "client_id"     = $ClientId
                    "refresh_token" = $refreshToken
                }
            }
            try
            {
                Write-Host "Attempting authentication to $subject using refresh token..."
                $TokenRequest = Invoke-RestMethod @TokenRequestParams -UseBasicParsing
                $accessToken = $TokenRequest.access_token
                try {
                    $jwtToken = Parse-JWTtoken -token $accessToken
                    Write-Host -ForegroundColor Green "Authenticated using refresh token as user $($jwtToken.name) ($($jwtToken.upn))"
                    $authContext += @{
                        "AccessToken"  = $accessToken
                        "UtcExpiresOn" = [Datetime]::new(1970,1,1).AddSeconds($TokenRequest.expires_on)
                        "RefreshToken" = $TokenRequest.refresh_token
                        "Credential"   = $null
                        "ClientSecret" = $null
                        "scopes"       = ""
                    }
                }
                catch {
                    $accessToken = $null
                    throw "Invalid Access token"
                }
            }
            catch {
                Write-Host -ForegroundColor Yellow "Refresh token not valid"
            }
        }
        if (!$accessToken -and $includeDeviceLogin) {
            
            $deviceCodeRequest = $null
            $deviceLoginStart = [DateTime]::Now
            $accessToken = ""
            $cnt = 0
    
            while ($accessToken -eq "" -and ([DateTime]::Now.Subtract($deviceLoginStart) -lt $deviceLoginTimeout)) {
                if (!($deviceCodeRequest)) {
                    $DeviceCodeRequestParams = @{
                        Method = 'POST'
                        Uri    = "$($authority.TrimEnd('/'))/oauth2/devicecode"
                        Body   = @{
                            "client_id" = $ClientId
                            "resource"  = $Resource
                        }
                    }
                    
                    $deviceLoginStart = [DateTime]::Now
                    Write-Host "Attempting authentication to $subject using device login..."
                    $DeviceCodeRequest = Invoke-RestMethod @DeviceCodeRequestParams -UseBasicParsing
                    Write-Host $DeviceCodeRequest.message -ForegroundColor Yellow
                    Write-Host -NoNewline "Waiting for authentication"
    
                    $TokenRequestParams = @{
                        Method = 'POST'
                        Uri    = "$($authority.TrimEnd('/'))/oauth2/token"
                        Body   = @{
                            "grant_type" = "urn:ietf:params:oauth:grant-type:device_code"
                            "code"       = $DeviceCodeRequest.device_code
                            "client_id"  = $ClientId
                        }
                    }
                }
    
                Start-Sleep -Seconds 1
                try {
                    $TokenRequest = Invoke-RestMethod @TokenRequestParams -UseBasicParsing
                    $accessToken = $TokenRequest.access_token
                }
                catch {
                    $tokenRequest = $null
                    $exception = $_
                    try {
                        $err = ($exception.ErrorDetails.Message | ConvertFrom-Json).error
                        if ($err -eq "code_expired") {
                            Write-Host
                            Write-Host -ForegroundColor Red "Authentication request expired."
                            $deviceCodeRequest = $null
                        }
                        elseif ($err -eq "expired_token") {
                            Write-Host
                            Write-Host -ForegroundColor Red "Authentication token expired."
                            throw $exception
                        }
                        elseif ($err -eq "authorization_declined") {
                            Write-Host
                            Write-Host -ForegroundColor Red "Authentication request declined."
                            throw $exception
                        }
                        elseif ($err -eq "authorization_pending") {
                            if ($cnt++ % 5 -eq 0) {
                                Write-Host -NoNewline "."
                            }
                        }
                        else {
                            Write-Host
                            throw $exception
                        }
                    }
                    catch {
                        Write-Host 
                        throw $exception
                    }
                }
                if ($accessToken) {
                    try {
                        $jwtToken = Parse-JWTtoken -token $accessToken
                        Write-Host
                        Write-Host -ForegroundColor Green "Authenticated from $($jwtToken.ipaddr) as user $($jwtToken.name) ($($jwtToken.upn))"
                        $authContext += @{
                            "AccessToken"  = $accessToken
                            "UtcExpiresOn" = [Datetime]::new(1970,1,1).AddSeconds($TokenRequest.expires_on)
                            "RefreshToken" = $TokenRequest.refresh_token
                            "Credential"   = $null
                            "ClientSecret" = $null
                            "scopes"       = ""
                        }
                    }
                    catch {
                        $accessToken = $null
                        throw "Invalid Access token"
                    }
                }
            }
        }
    }
    if (!$accessToken) {
        Write-Host
        Write-Host -ForegroundColor Yellow "Authentication failed"
        return $null
    }
    return $authContext
}
Export-ModuleMember -Function New-BcAuthContext
