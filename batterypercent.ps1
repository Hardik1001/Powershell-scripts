[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')

while(1){

  $battery_check=WMIC PATH Win32_Battery Get EstimatedChargeRemaining
  $batstr=[string]$battery_check
  $batno=[int]$batstr.Substring(25,32)

  if($batno -le 7){
  $ButtonType = [System.Windows.Forms.MessageBoxButtons]::OK
  $MessageIcon = [System.Windows.Forms.MessageBoxIcon]::Exclamation
  $MessageBody = "Battery Percent: " + $batno + "%, plug in your device."
  $MessageTitle = "Battery alert"

  $Result = [System.Windows.Forms.MessageBox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon)
  break
  }

  elseif($batno -gt 95){
  $ButtonType = [System.Windows.Forms.MessageBoxButtons]::OK
  $MessageIcon = [System.Windows.Forms.MessageBoxIcon]::Exclamation
  $MessageBody = "Battery Percent: " + $batno + "%, Charging full, unplug your device to protect battery health."
  $MessageTitle = "Battery alert"

  $Result = [System.Windows.Forms.MessageBox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon)
  break
  }

}
