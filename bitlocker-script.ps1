$lastValue = ""

while($true) {
    $output = manage-bde -status C:
    $status = ($output | Select-String 'Estado de conversión:').ToString()
    $percentage = ($output | Select-String 'Porcentaje cifrado:').ToString()

    if($status -match 'Estado de conversión:\s+(.+)$') {
        $statusValue = $matches[1]
    }

    if($percentage -match 'Porcentaje cifrado:\s+(.+)$') {
        $percentageValue = $matches[1]

        if($percentageValue -ne $lastValue) {
            Clear-Host
            Write-Host 'Monitoreando estado de BitLocker...'
            Write-Host ("Estado: [{0}]" -f $statusValue)
            Write-Host ("Progreso: {0}" -f $percentageValue)
            Write-Host "`nEsperando cambios en el progreso..."

            $lastValue = $percentageValue
        }
    }

    if($statusValue -eq 'Descifrado en progreso') {
        Start-Sleep -Seconds 2
    } else {
        Clear-Host
        Write-Host 'Monitoreando estado de BitLocker...'
        Write-Host ("Estado: [{0}]" -f $statusValue)
        Write-Host ("Progreso: {0}" -f $percentageValue)
        Write-Host ''
        Write-Host "El proceso ya no está en 'Descifrado en progreso'"
        Write-Host ("Estado final: [{0}]" -f $statusValue)
        Read-Host "Presione Enter para continuar"
        exit
    }
}