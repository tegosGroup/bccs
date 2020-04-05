#
# Module manifest for module 'PSGet_NavContainerHelper'
#
# Generated by: Freddy Kristiansen
#
# Generated on: 11/5/2019
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'NavContainerHelper.psm1'

# Version number of this module.
ModuleVersion = '0.6.4.17'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'ae60837a-fa30-4e28-a5ef-b8cd4cf6640a'

# Author of this module
Author = 'Freddy Kristiansen'

# Company or vendor of this module
CompanyName = 'Microsoft'

# Copyright statement for this module
Copyright = '(c) 2017 Freddy Kristiansen. All rights reserved.'

# Description of the functionality provided by this module
Description = 'PowerShell module'

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Add-FontsToNavContainer', 'Add-GitToAlProjectFolder', 
               'Backup-NavContainerDatabases', 
               'Check-NavContainerHelperPermissions', 'Clean-BcContainerDatabase', 
               'Compile-AppInNavContainer', 'Compile-ObjectsInNavContainer', 
               'Convert-AlcOutputToAzureDevOps', 'Convert-ModifiedObjectsToAl', 
               'Convert-Txt2Al', 'Copy-AlSourceFiles', 'Copy-CompanyInNavContainer', 
               'Copy-FileFromNavContainer', 'Copy-FileToNavContainer', 
               'Create-AadAppsForNav', 'Create-AadUsersInNavContainer', 
               'Create-AlProjectFolderFromNavContainer', 'Create-MyDeltaFolder', 
               'Create-MyOriginalFolder', 'Download-File', 'Enter-NavContainer', 
               'Export-ModifiedObjectsAsDeltas', 
               'Export-NavContainerDatabasesAsBacpac', 
               'Export-NavContainerObjects', 'Extract-AppFileToFolder', 
               'Extract-FilesFromNavContainerImage', 
               'Extract-FilesFromStoppedNavContainer', 
               'Flush-ContainerHelperCache', 'Generate-SymbolsInNavContainer', 
               'Get-BestNavContainerImageName', 'Get-BestGenericImageName', 'Get-CompanyInNavContainer', 
               'Get-LocaleFromCountry', 'Get-NavContainerApiCompanyId', 
               'Get-NavContainerApp', 'Get-NavContainerAppInfo', 
               'Get-NavContainerAppRuntimePackage', 'Get-NavContainerCountry', 
               'Get-NavContainerDebugInfo', 'Get-NavContainerEula', 
               'Get-NavContainerEventLog', 'Get-NavContainerGenericTag', 
               'Get-NavContainerId', 'Get-NavContainerImageLabels', 
               'Get-NavContainerImageName', 'Get-NavContainerImageTags', 
               'Get-NavContainerIpAddress', 'Get-NavContainerLegal', 
               'Get-NavContainerName', 'Get-NavContainerNavUser', 
               'Get-NavContainerNavVersion', 'Get-NavContainerOsVersion', 
               'Get-NavContainerPath', 'Get-NavContainerPlatformVersion', 
               'Get-NavContainers', 'Get-NavContainerServerConfiguration', 
               'Get-NavContainerSession', 'Get-NavContainerSharedFolders', 
               'Get-NavContainerTenants', 'Get-NavVersionFromVersionInfo', 
               'Get-TestsFromNavContainer', 'Get-LatestAlLanguageExtensionUrl', 
               'Import-ConfigPackageInNavContainer', 'Import-DeltasToNavContainer', 
               'Import-NavContainerLicense', 'Import-ObjectsToNavContainer', 
               'Import-PfxCertificateToNavContainer', 
               'Import-TestToolkitToNavContainer', 'Install-NavContainerApp', 
               'Install-NAVSipCryptoProviderFromNavContainer', 
               'Invoke-NavContainerApi', 'Invoke-NavContainerCodeunit', 
               'Invoke-ScriptInNavContainer', 'New-CompanyInNavContainer', 
               'New-DesktopShortcut', 'New-LetsEncryptCertificate', 
               'New-NavContainer', 'New-NavContainerNavUser', 
               'New-NavContainerTenant', 'New-NavContainerWindowsUser', 
               'Open-NavContainer', 'Publish-NavContainerApp', 
               'Publish-NewApplicationToNavContainer', 
               'Remove-CompanyInNavContainer', 
               'Remove-ConfigPackageInNavContainer', 'Remove-DesktopShortcut', 
               'Remove-NavContainer', 'Remove-NavContainerSession', 
               'Remove-NavContainerTenant', 'Renew-LetsEncryptCertificate', 
               'Repair-NavContainerApp', 'Replace-DependenciesInAppFile', 
               'Replace-NavServerContainer', 'Restart-NavContainer', 
               'Restore-DatabasesInNavContainer', 'Run-TestsInNavContainer', 
               'Setup-NavContainerTestUsers', 
               'Setup-TraefikContainerForNavContainers', 'Sign-NavContainerApp', 
               'Sort-AppFoldersByDependencies', 'Start-NavContainer', 
               'Start-NavContainerAppDataUpgrade', 'Stop-NavContainer', 
               'Sync-NavContainerApp', 'Test-NavContainer', 
               'UnInstall-NavContainerApp', 'UnPublish-NavContainerApp', 
               'Wait-NavContainerReady', 'Write-NavContainerHelperWelcomeText'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'Add-FontsToBCContainer', 'Backup-BCContainerDatabases', 
               'Compile-AppInBCContainer', 'Copy-CompanyInBCContainer', 
               'Copy-FileFromBCContainer', 'Copy-FileToBCContainer', 
               'Create-AadAppsForBC', 'Create-AadUsersInBCContainer', 
               'Create-AlProjectFolderFromBcContainer', 'Enter-BCContainer', 
               'Export-BCContainerDatabasesAsBacpac', 
               'Extract-FilesFromBCContainerImage', 
               'Extract-FilesFromStoppedBCContainer', 
               'Get-BCContainerApiCompanyId', 'Get-BCContainerApp', 
               'Get-BCContainerAppInfo', 'Get-BCContainerAppRuntimePackage', 
               'Get-BCContainerBCUser', 'Get-BCContainerCountry', 
               'Get-BCContainerDebugInfo', 'Get-BCContainerEula', 
               'Get-BCContainerEventLog', 'Get-BCContainerGenericTag', 
               'Get-BCContainerId', 'Get-BCContainerImageLabels', 
               'Get-BCContainerImageName', 'Get-BCContainerImageTags', 
               'Get-BCContainerIpAddress', 'Get-BCContainerLegal', 
               'Get-BCContainerName', 'Get-BCContainerNavVersion', 
               'Get-BCContainerOsVersion', 'Get-BCContainerPath', 
               'Get-BCContainerPlatformVersion', 'Get-BCContainers', 
               'Get-BCContainerServerConfiguration', 'Get-BCContainerSession', 
               'Get-BCContainerSharedFolders', 'Get-BCContainerTenants', 
               'Get-BestBCContainerImageName', 'Get-CompanyInBCContainer', 
               'Get-TestsFromBCContainer', 'Import-BCContainerLicense', 
               'Import-ConfigPackageInBCContainer', 
               'Import-PfxCertificateToBCContainer', 
               'Import-TestToolkitToBCContainer', 'Install-BCContainerApp', 
               'Install-NAVSipCryptoProviderFromBCContainer', 
               'Invoke-BCContainerApi', 'Invoke-ScriptInBCContainer', 
               'New-BCContainer', 'New-BCContainerBCUser', 'New-BCContainerTenant', 
               'New-BCContainerWindowsUser', 'New-CompanyInBCContainer', 
               'Open-BCContainer', 'Publish-BCContainerApp', 
               'Publish-NewApplicationToBcContainer', 'Remove-BCContainer', 
               'Remove-BCContainerSession', 'Remove-BCContainerTenant', 
               'Remove-CompanyInBCContainer', 'Remove-ConfigPackageInBCContainer', 
               'Repair-BCContainerApp', 'Replace-BCServerContainer', 
               'Restart-BCContainer', 'Restore-DatabasesInBCContainer', 
               'Run-TestsInBCContainer', 'Setup-BCContainerTestUsers', 
               'Setup-TraefikContainerForBCContainers', 'Sign-BCContainerApp', 
               'Start-BCContainer', 'Start-BCContainerAppDataUpgrade', 
               'Stop-BCContainer', 'Sync-BCContainerApp', 'Test-BCContainer', 
               'UnInstall-BCContainerApp', 'UnPublish-BCContainerApp', 
               'Wait-BCContainerReady'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
FileList = 'ContainerHandling\docker.ico'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/Microsoft/navcontainerhelper/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://www.github.com/microsoft/navcontainerhelper'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '0.6.4.17
Issue #700 Restore-DatabasesInBcContainer will clear the TestFunctions folder to force re-import
BREAKING CHANGE: added mandatory containerName parameter to Replace-DependenciesInAppFile
Issue #692 System.IO.Packaging.Package could not be found. This is fixed by the breaking change above
Detect Windows 10 1909 on host (no generic 1909 yet)
Add retry algorithm to SetupWebClient (as setupWebClient sometimes fails with locking issues)
Issue #710 traefik fails if PublicDnsName doesn''t contain a period (.)
Issue #711 Alias Install-BCContainerApp cannot be found'

        # External dependent modules of this module
        # ExternalModuleDependencies = ''

    } # End of PSData hashtable
    
 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

