<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>
function Get-Base64File
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([String])]
    Param
    (
        [Parameter(Mandatory = $true)]
        [ValidateScript({
            Test-PathParameter -Path $_
        })]
        [String]
        $Path
    )

    Begin
    {
        $Path = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Path)
    }
    Process
    {
        ConvertTo-Base64String -InputObject ([IO.File]::ReadAllBytes($Path))
    }
    End
    {
    }
}