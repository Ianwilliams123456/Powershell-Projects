$ObjectExportPath = 'desktop\Objects_list.csv'
$SortedObjectPath = 'desktop\Sorted_Objects_list.csv'
#$LizzieInfo = 
Get-AdObject -Filter * | Select-Object Enable,ObjectClass,DistinguishedName,Name |  Export-Csv -NoType $ObjectExportPath
$selection=read-host "please type user or computer"
$sort=Import-Csv -Path $ObjectExportPath
write $sort.Enable
#foreach ($idea in $sort){ 
   # if (($idea.objectclass -eq $selection) -and (enabled -eq $True))
   # {
   # $idea | Export-Csv -Path $SortedObjectPath -append}
   # } 
  
#Get-Aduser -Filter "name -eq 'Lizzie Terrell'" -properties * | Export-Csv -Path 'desktop\LizzieInfo.csv'
#enabled -eq $true