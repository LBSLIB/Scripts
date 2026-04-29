# ================================
# Office 2024 Deployment Script
# ================================

$officeRegKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
$officeSubKey = "Standard2019Volume - en-us"
$ProgramDataLocation = "C:\ProgramData\Office_2024_Source"
$LogLocation = "$ProgramDataLocation\Office_2024_Install.log"
cd $ProgramDataLocation
# Ensure source folder exists BEFORE logging
If (!(Test-Path $ProgramDataLocation))
{
    New-Item -Path $ProgramDataLocation -ItemType Directory -Force | Out-Null
}

# -------------------------------
# Logging Function
# -------------------------------
function Write-Log 
{
    param
    (
        [string]$Message,
        [string]$Level = "INFO"
    )

    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$TimeStamp [$Level] - $Message" | Out-File -FilePath $LogLocation -Append -Encoding UTF8
}

Write-Log "========================================"
Write-Log "Starting Office 2024 deployment"

# -------------------------------
# Copy Installation Files
# -------------------------------
Write-Log "Starting installation media copy"

$Robocopy = robocopy "\\LBSVSLAPP100.lbspn.local\DF_Packages\Office_2024_Standard" `
                     $ProgramDataLocation `
                     /COPY:DAT /E /XO /W:0 /R:1 /MT:64 /V /TEE /UNILOG+:$LogLocation

$ExitCode = $LASTEXITCODE

If ($ExitCode -le 3)
{
    Write-Log "Robocopy completed successfully (ExitCode: $ExitCode)"
}
Else
{
    Write-Log "Robocopy failed (ExitCode: $ExitCode)" "ERROR"
    Exit $ExitCode
}

Start-Sleep -Seconds 2

Try
{
    taskkill /im office* /f
    taskkill /im setup* /f
    taskkill /im office* /f
    taskkill /im setup* /f
}
Catch
{

}

# -------------------------------
# Detect and Uninstall Office 2019
# -------------------------------
$uninstallKeyPath = Join-Path $officeRegKey $officeSubKey

If (Test-Path $uninstallKeyPath)
{
    Write-Log "Detected Office 2019 - Starting uninstall"

    cd C:\ProgramData\Office_2024_Source\Office_2019_Standard_Uninstall
    $Office2019Uninstall = Start-Process "setup.exe" -ArgumentList "/Configure Uninstall.xml" -Wait -PassThru

    If ($Office2019Uninstall.ExitCode -eq 0)
    {
        Write-Log "Office 2019 uninstall completed successfully"
    }
    Else
    {
        Write-Log "Office 2019 failed to uninstall (ExitCode: $($Office2019Uninstall.ExitCode))" "ERROR"
        Exit $Office2019Uninstall.ExitCode
    }
}
Else
{
    Write-Log "Office 2019 not detected - skipping uninstall"
}

# -------------------------------
# Install Office 2024
# -------------------------------


$c2r = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" -ErrorAction SilentlyContinue

If (-not $c2r -or $c2r.ProductReleaseIds -notmatch "2024")
{
    Write-Log "Started Office 2024 installation"

    cd C:\ProgramData\Office_2024_Source\Office_2024_Standard
    $Office2024Install = Start-Process "setup.exe" -ArgumentList "/Configure Configuration_Office_2024_Standard_x64_LBSLIB.xml" -Wait -PassThru

    Do
    {
        Start-Sleep -Seconds 10
        $c2r = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration" -ErrorAction SilentlyContinue
    }
    While (-not $c2r.VersionToReport)

    Write-Log "Office 2024 installation completed successfully"

    If ($Office2024Install.ExitCode -eq 0) 
    {

    }
    Else 
    {
        Write-Log "Office 2024 failed to install (ExitCode: $($Office2024Install.ExitCode))" "ERROR"
        Exit $Office2024Install.ExitCode
    }
}
Else
{
    Write-Log "Office 2024 detected - skipping install"
}

Write-Log "Office 2024 deployment finished successfully"
Write-Log "========================================"

$MachineName = $env:COMPUTERNAME
$Destination = "\\LBSVSLAPP100.lbspn.local\DF_Packages\Office_2024_Standard_Logs\Success\$MachineName.log"

Write-Host "Log exists: $(Test-Path $LogLocation)"
Write-Host "Destination reachable: $(Test-Path \\LBSVSLAPP100.lbspn.local\DF_Packages\Office_2024_Standard_Logs)"

Copy-Item $LogLocation $Destination -Force -ErrorAction Stop
Exit 0