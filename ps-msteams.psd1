@{
    # Script module or binary module file associated with this manifest.
    RootModule        = 'ps-msteams.psm1'
    ModuleVersion     = '1.0'
    GUID              = 'fcc65708-611f-4815-8b9d-fa1fa232bccc'
    Author            = 'Chris Herrera'
    CompanyName       = ''
    Copyright         = '(c) 2021 Chris Herrera. All rights reserved.'
    Description       = 'A module used to assist in interacting with MS Teams'
    PowerShellVersion = '4.0'

    FunctionsToExport = @('Send-MSMessage')

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @('MSTeams', 'ChatOps')

            # A URL to the license for this module.
            # LicenseUri = ''

            # A URL to the main website for this project.
            # ProjectUri = ''

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            # ReleaseNotes = ''

        }
    }
}

