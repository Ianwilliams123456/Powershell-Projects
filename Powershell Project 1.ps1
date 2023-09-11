$UserExportPath = 'desktop\Users_list.csv’
$userloginpath = 'desktop\userlogin_list.csv'
Get-ADUser -Filter * | Select-object DistinguishedName,Name,UserPrincipalName,lastlogondate | Export-Csv -NoType $UserExportPath
$daysbefore = read-host "how many days to look back?"
$Date = (Get-date).AddDays(-$daysbefore)
get-aduser -Filter {(Enabled -eq "false") -and (lastlogondate -lt $Date)} | export-csv -notype $userloginpath


$ComputerExportPath = 'desktop\Computers_list.csv'
$computerloginpath = 'desktop\computerlogin_list.csv'
Get-AdComputer -Filter * | Select-Object DistinguishedName,Name,Ipv4address | Export-Csv -NoType $ComputerExportPath
$daysbefore = read-host "how many days to look back?"
$Date = (Get-date).AddDays(-$daysbefore)
Get-AdComputer -Filter {(Enabled -eq "false") -and (lastlogondate -lt $Date)} | export-csv -notype $computerloginpath

$ObjectExportPath = 'desktop\Other_Objects_list.csv'
$objectloginpath = 'desktop\objectlogin_list.csv'
Get-AdObject -Filter * | Where-Object {($_.Objectclass -notlike "*user*") -and ($_.Objectclass -notlike "*computer*")} | Select-Object DistinguishedName, Name, ObjectClass |  Export-Csv -NoType $ObjectExportPath
$daysbefore = read-host "how many days to look back?"
$Date = (Get-date).AddDays(-$daysbefore)
Get-AdComputer -Filter {(Enabled -eq "false") -and (lastlogondate -lt $Date)} | export-csv -notype $computerloginpath
