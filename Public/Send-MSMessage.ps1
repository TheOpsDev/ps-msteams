function Send-MSMessage {
<#
.SYNOPSIS
Send a MS Teams message card to a channel with a pre-configured incoming web hook

.DESCRIPTION
Send a MS Teams message card to a channel with a pre-configured incoming web hook

.PARAMETER ConnectorUri
Incoming connector web hook URL for channel

.PARAMETER Title
Bold styled title to show on message card

.PARAMETER MessageBody
Text body to show in the message card

.PARAMETER Color
[OPTIONAL] Color to hightlight the left border of the message card. It can be helpful when 
trying to highlight an issue or successful build, etc. Default value is set to blue
#>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact="High")]
    param (
        [Parameter(Mandatory)]
        [string[]]
        $ConnectorUri,
        [Parameter(Mandatory)]
        [string]
        $Title,
        [Parameter(Mandatory)]
        [string]
        $MessageBody,
        [Parameter()]
        [ValidatePattern("^[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]$")]
        [string]
        $Color = "0078D7"
    )
    
    begin {
        $jsonBody = [PSCustomObject][Ordered]@{
            "@type"      = "MessageCard"
            "@context"   = "https://schema.org/extensions"
            "summary"    = $Title
            "themeColor" = $Color
            "title"      = $Title
            "text"       = $MessageBody
        }

        $teamsMessageBody = ConvertTo-Json -InputObject $jsonBody -Depth 100
    }
    
    process {
        foreach ($uri in $ConnectorUri) {
            $postMessageParams = @{
                Uri           = $uri
                Method        = "POST"
                Body          = $teamsMessageBody
                "ContentType" = "application/json"
                ErrorAction   = "Stop"
            }
            if ($PSCmdlet.ShouldProcess($postMessageParams, "Posting message card to MS Teams Channel")) {
                try {
                    Invoke-RestMethod @postMessageParams
                    return $true
                } catch {
                    return $false
                }
            }
        }
    }
}