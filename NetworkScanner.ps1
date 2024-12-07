
# Definiere den IP-Adressbereich
$subnet = "192.168.1"  # Netzwerkteil der IP-Adresse
$startIP = 1           # Start-IP
$endIP = 254           # End-IP

# Ergebnisdatei
$outputFile = "D:\Testing\Scans\NetworkScanResults.csv"

# Title für CSV-Datei
"IP-Adresse,Status,Antwortzeit (ms)" | Out-File -FilePath $outputFile

# IP-Adressen im Bereich anpingen
for ($i = $startIP; $i -le $endIP; $i++) {
    $ipAddress = "$subnet.$i"
    
    # Pingen
    $pingResult = Test-Connection -ComputerName $ipAddress -Count 1 -Quiet

    if ($pingResult) {
        $responseTime = (Test-Connection -ComputerName $ipAddress -Count 1).ResponseTime
        "$ipAddress,Erreichbar,$responseTime" | Out-File -FilePath $outputFile -Append
    } else {
        "$ipAddress,Nicht erreichbar,N/A" | Out-File -FilePath $outputFile -Append
    }

    # Kurze Ausgabe auf der Konsole
    Write-Host "Ping an $ipAddress abgeschlossen."
}

Write-Host "Netzwerkscan abgeschlossen. Ergebnisse gespeichert in: $outputFile"
