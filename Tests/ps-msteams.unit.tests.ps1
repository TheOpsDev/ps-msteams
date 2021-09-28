BeforeAll {
    Import-Module $PSScriptRoot/../ps-msteams.psm1 -DisableNameChecking -ErrorAction Stop -Force
    $demoConnector = "https://bloffice.webhook.office.com/webhookb2/7d57d65c-debe-451e-a6fd-47b61576cb47@45d659f4-1555-498b-93b5-0b99a89a284b/IncomingWebhook/4943fc2f66d2472eb5431ecc380ad2fe/4d16e443-a94f-442d-9821-40ef6e30afdd"

    $params = @{
        ConnectorUri = $demoConnector
        Title        = "Unit Test"
        MessageBody  = "Unit test message"
        Color        = "0F8A1C"
    }
}

Describe "Send-MSMessage Unit Tests" {

    Context "Validate Parameter Input" {
        
        It "Should return $true on success" {
            $test = Send-MSMessage @params
            $test | Should -BeTrue
        }

        It "Should return $false on failure to send message" {
            $params.ConnectorUri = "https://bloffice.webhook.office.com/blah/blah"
            $test = Send-MSMessage @params 
            $test | Should -BeFalse
        }

        It "Should accept Hex color codes" {
            $params.Color | Should -Match "^[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]$"
        }

        It "Should fail on invalid Hex color codes" {
            $params.Color = "0F8A1C11"
            $params.Color | Should -Not -Match "^[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]$"
        }
    }
}