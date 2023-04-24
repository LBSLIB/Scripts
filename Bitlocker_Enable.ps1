$log = "$env:SystemDrive\Windows\Bitlocker.log"
$BitlockerStatus = Get-BitLockerVolume -MountPoint "C:"
$BitlockerStatus | out-host
$TPMStatus = Get-TPM
$TPMStatusEnabled = $TPMStatus.TpmEnabled
$SecureBootStatus = Confirm-SecureBootUEFI
$Time = -join @((Get-Date -Format "HH:mm"), " ", (Get-WmiObject -Class Win32_TimeZone | Select-Object -ExpandProperty Bias))
$Date = (Get-Date -Format "dd-MM-yyyy")


If(($BitlockerStatus.protectionstatus -eq "On") -and ($BitlockerStatus.VolumeStatus -eq "FullyEncrypted"))

{
$Date ,$Time | Out-File $log -Append
$bitlockerStatus | Out-File $log -Append    
}


If($BitlockerStatus.protectionstatus -eq "Off")
{
    If(($TPMStatus.TpmEnabled -eq $True) -and ($SecureBootStatus -eq $True))
    {
        "TPM is Enabled and SecureBoot is Enabled. Running rest of the tasks." | Out-File $log -Append

        "Checking UEFI Secure Boot Status" | Out-File $log -Append
        "SecureBootUEFI  ", (Confirm-SecureBootUEFI) | Out-File $log -Append
        "-----------"

        If ($BitlockerStatus.VolumeStatus -eq "FullyDecrypted")
        {
        "Volume Status"   , ($BitlockerStatus.VolumeStatus) | Out-File $log -Append
	    "Adding Key Protectors" | Out-File $log -Append
	    #Create Recovery Key            
        manage-bde -protectors -add C: -tpm
	    manage-bde -protectors -add C: -recoverypassword

	    "Setting Recovery Password to AD"
	    #Set Recovery Key to be saved to AD     
            $Computer="$env:ComputerName"
            $BitLocker = Get-WmiObject -ComputerName $Computer -Namespace Root\cimv2\Security\MicrosoftVolumeEncryption -Class Win32_EncryptableVolume 
            $id = $BitLocker.GetKeyProtectors(3).volumekeyprotectorid | Select -First 1 
            manage-bde.exe -cn $Computer -protectors -adbackup c: -id $id | Out-File $log -Append 
		
	   "Activating Bitlocker" | Out-File $log -Append
        $Date ,$Time | Out-File $log -Append
	    #Activate Bitlocker
        manage-bde.exe -on C: -UsedSpaceOnly -cn $Computer -em xts_aes256  | Out-File $log -Append 

	    Sleep 20
	    $BitlockerStatus = Get-BitLockerVolume -MountPoint "C:"
	    $bitlockerStatus | Out-File $log -Append    	
        
         }


        If(($BitlockerStatus.protectionstatus -eq "On") -and ($BitlockerStatus.VolumeStatus -eq "FullyEncrypted"))
            {
        $Date ,$Time | Out-File $log -Append  
	    $BitlockerStatus = Get-BitLockerVolume -MountPoint "C:"
	    $bitlockerStatus | Out-File $log -Append  
       
        #Set Recovery Key to be saved to AD     
       
        $Computer="$env:ComputerName"
        $BitLocker = Get-WmiObject -ComputerName $Computer -Namespace Root\cimv2\Security\MicrosoftVolumeEncryption -Class Win32_EncryptableVolume 
        $id = $BitLocker.GetKeyProtectors(3).volumekeyprotectorid | Select -First 1 
        manage-bde.exe -cn $Computer -protectors -adbackup c: -id $id | Out-File $log -Append 
        
            }

         

     }
     Else
     {
        "EITHER TPM IS DISABLED OR BOTH TPM AND SECURE BOOT ARE DISABLED" | Out-File $log -Append
     }
	
}


