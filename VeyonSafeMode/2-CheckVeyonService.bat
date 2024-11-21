@echo off
echo ======================================================
echo Verifica della Configurazione di Veyon per la Modalità Provvisoria con Rete
echo ======================================================

set keys_checked=0
set keys_missing=0

echo.
echo Verifica dei servizi richiesti in Modalità Provvisoria con Rete...

for %%S in (PlugPlay EventLog RpcSs Tcpip VeyonService) do (
    reg query "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Network\%%S" >nul 2>&1
    if errorlevel 1 (
        echo [MANCANTE] La chiave del servizio %%S NON esiste sotto SafeBoot\Network.
        set /a keys_missing+=1
    ) else (
        reg query "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Network\%%S" /ve >"%temp%\regcheck.txt"
        findstr /i /c:"(Predefinito)    REG_SZ    Service" "%temp%\regcheck.txt" >nul
        if errorlevel 1 (
            echo [ERRATO] Il valore predefinito per %%S non è "Service".
            set /a keys_missing+=1
        ) else (
            echo [OK] La chiave del servizio %%S esiste con il valore predefinito corretto.
            set /a keys_checked+=1
        )
        del "%temp%\regcheck.txt"
    )
)

echo.
echo Verifica dell'entry di avvio di Veyon nella chiave Run...

reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v VeyonSafeMode >nul 2>&1
if errorlevel 1 (
    echo [MANCANTE] Entry nella chiave Run "VeyonSafeMode" non trovata.
    set /a keys_missing+=1
) else (
    reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v VeyonSafeMode >"%temp%\runcheck.txt"
    findstr /i /c:"veyon-cli.exe" "%temp%\runcheck.txt" >nul
    if errorlevel 1 (
        echo [ERRATO] Il valore di "VeyonSafeMode" non contiene "veyon-cli.exe".
        set /a keys_missing+=1
    ) else (
        echo [OK] Entry nella chiave Run "VeyonSafeMode" trovata con il valore corretto.
        set /a keys_checked+=1
    )
    del "%temp%\runcheck.txt"
)


echo.
echo ======================================================
echo Totale chiavi verificate: %keys_checked%
echo Totale problemi riscontrati: %keys_missing%
echo ======================================================

if %keys_missing%==0 (
    echo Tutte le chiavi di registro sono configurate correttamente.
) else (
    echo Alcune chiavi di registro sono mancanti o errate.
)

echo.
pause
