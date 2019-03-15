$source = Get-Content ".\Test-Connectivity-Sources.txt"
$target = Get-Content ".\Test-Connectivity-Targets.txt"
$config = Get-Content ".\Test-Connectivity-Config.txt"

foreach ($s in $source.Where({ $_ -ne "" })) { 
    foreach ($t in $target.Where({ $_ -ne "" })) {
        if ($config.Where({ $_ -eq "fulllogging"})){
            Add-Content -Path "Connection.log" - Value Test-Connection -Source $s -ComputerName $t
        }
        if (-not(Test-Connection -ComputerName $t -Quiet)) {
            $line = ((Get-Date -DisplayHint DateTime).toString() + " Targetserver: " + ($t.toString()))
            Add-Content -Path "Disconnection.log" -Value $line       
        }  
    }   
}
