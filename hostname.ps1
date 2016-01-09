$inputFile= import-csv "C:\temp\mexicoIP.csv"
$ip= $inputFile.Hostname
foreach ($i in $ip){
   
      $hostname=(Resolve-DnsName $i -EA SilentlyContinue).NameHost
      if ($hostname){"Hostname:$hostname and IP:$i" |Out-File "C:\temp\hostss.txt" -Append}
     
}
