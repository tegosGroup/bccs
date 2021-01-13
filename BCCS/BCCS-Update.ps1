if (Test-Path "$($bccsScriptFolder)\.git") {
    try {
        $branch = &git -C $bccsScriptFolder rev-parse --abbrev-ref HEAD 
        $checkout = $true
        if ($branch -ne "master") {
            Write-host "You are currently not on master branch but $($branch). Do you want to checkout origin/master?" -ForegroundColor Yellow
            $ReadHost = Read-Host " ( y / n ) "
            Switch ($ReadHost) {
                y { $checkout = $true }
                n { $checkout = $false }
                Default { $checkout = $false }
            }
        }
        if ($checkout) {
			Write-Log "Fetching..."
            git -C $bccsScriptFolder fetch
			Write-Log "Checking out master and/or pulling changes..."
            git -C $bccsScriptFolder checkout master
            git -C $bccsScriptFolder pull
        }
    }
    catch {
        Write-Log "Could not update using git"
    }
}