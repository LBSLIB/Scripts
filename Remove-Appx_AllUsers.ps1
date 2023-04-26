Out-Host "##################################"
Out-Host "Remove-Appx Started"
Out-Host "##################################"


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
                   Out-Host "$($BlackListedApp) removed"
              }
    }
