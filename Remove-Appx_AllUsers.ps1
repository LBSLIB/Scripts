$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.BingNews" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.BingWeather" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.GamingApp" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.MicrosoftSolitaireCollection" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.WindowsCommunicationsApps" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.WindowsFeedbackHub" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.XboxGameOverlay" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.XboxGamingOverlay" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.XboxIdentityProvider" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.XboxSpeechToTextOverlay" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.XboxGameCallableUI" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.Xbox.TCUI" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.YourPhone" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.ZuneMusic" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.ZuneVideo" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.MicrosoftOfficeHub" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.Todos" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.WindowsMaps" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.People" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.WindowsAlarms" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.GetHelp" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.MicrosoftStickyNotes" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.PowerAutomateDesktop" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.OneDriveSync" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Microsoft.WindowsTerminal" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "Clipchamp.Clipchamp" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers

$AppProvisioningPackageName = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "MicrosoftTeams" } | Select-Object -ExpandProperty PackageName -First 1
Remove-AppxProvisionedPackage -PackageName $AppProvisioningPackageName -Online -AllUsers
