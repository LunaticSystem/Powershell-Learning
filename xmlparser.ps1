#===============================
# Parsing xml files
#
# Author: Brendan Vandercar
#
#===============================
$outfile="C:\temp\mexIP.csv"
$path = "C:\Users\BVan18\Desktop\scans"
$files = get-childitem $path 
foreach ($f in $files)
{
    Write-Host $f
    [xml]$doc = get-content ($path + "\" + $f) 
    foreach ($d in $doc.Advanced_IP_scanner.row)
    {
        Write-Host $d
        $name = $d.name
        $ip = $d.ip
        $share = @($d.Share.name)
        $sharejoin = $share -join (':')
        Write-host $sharejoin
        $object = New-Object PSobject
        $object |Add-Member -MemberType NoteProperty -Name "Hostname" -Value $name
        $object |Add-Member -MemberType NoteProperty -Name "IP Address" -Value $ip
        $object |Add-Member -MemberType NoteProperty -Name "Shares" -Value $sharejoin
        $object |select * | Export-Csv -Path 'C:\temp\mexIP.csv' -NoTypeInformation -Append
        ##DEBUG##
        
       
    }
}
