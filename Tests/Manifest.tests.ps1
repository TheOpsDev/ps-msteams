BeforeAll {
    $manifest     = Import-PowerShellDataFile -Path $PSScriptRoot/../ps-msteams.psd1
    $manifestData = Test-ModuleManifest -Path $PSScriptRoot/../ps-msteams.psd1 -ErrorAction Stop -WarningAction SilentlyContinue
}

Describe "Module Manifest" {

    Context "Validation" {

        It "Has a valid manifest" {
            $manifestData | Should -Not -BeNullOrEmpty
        }

        It "Has a valid name in the manifest" {
            $manifestData.Name | Should -Be 'ps-msteams'
        }
        
        It "Has a valid root module" {
            $manifestData.RootModule | Should -Be "ps-msteams.psm1"
        }

        It "Has a valid verison in the manifest" {
            $manifestData.Version -as [Version] | Should -Not -BeNullOrEmpty
        }

        It "Has a valid description" {
            $manifestData.Description | Should -Not -BeNullOrEmpty
        }

        It "Has a valid author" {
            $manifestData.Author | Should -Not -BeNullOrEmpty
        }

        It "Has a valid GUID" {
            { [guid]::Parse(($manifestData.Guid)) } | Should -Not -Throw
        }

        It "Has a valid copyright" {
            $manifestData.Copyright | Should -Not -BeNullOrEmpty
        }
    }

}