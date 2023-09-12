$users = get-aduser -filter * -Properties * | Select-Object Name,enabled,lockedout,AccountExpirationDate,lastlogondate
#$users



FOREACH ($user in $users) {

$uname = $user.Name
$uenabled = $user.enabled
$ulockedout = $user.lockedout
$uaccountexpy = $user.AccountExpirationDate
$ulastlogon = $user.lastlogondate

$uproperty = [ordered]@{'User Name' = $uname;
'Enabled' = $uenabled;
'Account Expiration' = $uaccountexpy;
}


$uobj = New-Object -TypeName PSObject -Property $uproperty
Write-Output $uobj
}

$computers = get-adcomputer -filter * -Properties * | Select-Object Name,enabled,lockedout,AccountExpirationDate,lastlogondate
#$computers
FOREACH ($computer in $computers) {

$cname = $computer.Name
$cenabled = $computer.enabled
$clockedout = $computer.lockedout
$caccountexpy = $computer.AccountExpirationDate
$clastlogon = $computer.lastlogondate

$cproperty = [ordered]@{'Computer Name' = $cname;
'Enabled' = $cenabled;
'Account Expiration' = $caccountexpy;
'Last Logon' = $clastlogon;
}


$cobj = New-Object -TypeName PSObject -Property $cproperty
Write-Output $cobj
}
