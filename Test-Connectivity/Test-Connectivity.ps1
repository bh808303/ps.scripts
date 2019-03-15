$target = Get-Content "Test-Connectivity-Targets.txt"
foreach ($t in $target.Where({ $_ -ne "" })) {
    if (-not(Test-Connection -ComputerName $t -Quiet)) {
        $line = ((Get-Date -DisplayHint DateTime).toString() + " Targetserver: " + ($t.toString()))
        Add-Content -Path "Disconnection.log" -Value $line
    }     
}