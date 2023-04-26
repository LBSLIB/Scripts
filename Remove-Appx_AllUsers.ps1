#Log Function
    function Write-LogEntry {
        param (
            [parameter(Mandatory = $true)]
            [ValidateNotNullOrEmpty()]
            [string]$Value,
            [parameter(Mandatory = $false)]
            [ValidateNotNullOrEmpty()]
            [string]$FileName = "AppXRemoval.log",
            [switch]$Stamp
        )

        #Build Log File appending System Date/Time to output
        $LogFile = Join-Path -Path $env:SystemRoot -ChildPath $("Temp\$FileName")
        $Time = -join @((Get-Date -Format "HH:mm:ss.fff"), " ", (Get-WmiObject -Class Win32_TimeZone | Select-Object -ExpandProperty Bias))
        $Date = (Get-Date -Format "dd-MM-yyyy")

        If ($Stamp) {
            $LogText = "<$($Value)> <time=""$($Time)"" date=""$($Date)"">"
        }
        else {
            $LogText = "$($Value)"   
        }

        Try {
            Out-File -InputObject $LogText -Append -NoClobber -Encoding Default -FilePath $LogFile -ErrorAction Stop
        }
        Catch [System.Exception] {
            Write-Warning -Message "Unable to add log entry to $LogFile.log file. Error message at line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
        }
    }

 


    Write-LogEntry -Value "##################################"
    Write-LogEntry -Stamp -Value "Remove-Appx Started"
    Write-LogEntry -Value "##################################"


    $BlackListedApps = "Microsoft.BingNews",
            "Microsoft.BingWeather",
            "Microsoft.GamingApp",
            "Microsoft.MicrosoftSolitaireCollection",
            "Microsoft.WindowsCommunicationsApps",
            "Microsoft.WindowsFeedbackHub",
            "Microsoft.XboxGameOverlay",
            "Microsoft.XboxGamingOverlay",
            "Microsoft.XboxIdentityProvider",
            "Microsoft.XboxSpeechToTextOverlay",
            "Microsoft.XboxGameCallableUI",
            "Microsoft.Xbox.TCUI",
            "Microsoft.YourPhone",
            "Microsoft.ZuneMusic",
            "Microsoft.ZuneVideo",
            "Microsoft.MicrosoftOfficeHub",
            "Microsoft.Todos",
            "Microsoft.WindowsMaps",
            "Microsoft.People",
            "Microsoft.WindowsAlarms",
            "Microsoft.GetHelp",
            "Microsoft.MicrosoftStickyNotes",
            "Microsoft.PowerAutomateDesktop",
            "Microsoft.OneDriveSync",
            "Microsoft.Getstarted",
            "Microsoft.WindowsTerminal",
            "Clipchamp.Clipchamp",
            "MicrosoftTeams"

 

Foreach($BlackListedApp in $BlackListedApps)
    {
         $AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like $BlackListedApp } | Select-Object -ExpandProperty PackageName -First 1
         $RemoveAppx = Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

         #Re-check existence
         $AppProvisioningPackageNameReCheck = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like $BlackListedApp } | Select-Object -ExpandProperty PackageName -First 1

 

         If ([string]::IsNullOrEmpty($AppProvisioningPackageNameReCheck) -and ($RemoveAppx.Online -eq $true))
              {
                   Write-LogEntry -Value "$($BlackListedApp) removed"
              }
    }
