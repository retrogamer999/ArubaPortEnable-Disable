$min = Get-Date '08:00'
$max = Get-Date '17:30'
$now = Get-Date
$Username = "insert-username-here"
$Password = "insert-password-here" | ConvertTo-SecureString -AsPlainText -Force
$IP = "192.168.40.57"

Import-Module PowerArubaSW

if ($min.TimeOfDay -le $now.TimeOfDay -and $max.TimeOfDay -ge $now.TimeOfDay) {
    Connect-ArubaSW -SkipCertificateCheck -Username $Username -Password $Password $IP
    Send-ArubaSWCliBatch -command "int 10", "enable", "wri mem"
    Disconnect-ArubaSW -Confirm:$false
}
else {
    Connect-ArubaSW -SkipCertificateCheck -Username $Username -Password $Password $IP
    Send-ArubaSWCliBatch -command "int 10", "disable", "wri mem"
    Disconnect-ArubaSW -Confirm:$false
}
