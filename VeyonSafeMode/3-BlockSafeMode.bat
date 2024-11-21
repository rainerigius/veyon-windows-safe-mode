@echo off
echo ======================================================
echo Configurazione delle impostazioni BCD per disabilitare il menu di avvio e le opzioni avanzate
echo ======================================================

:: Disabilita la visualizzazione del menu di avvio
bcdedit /set {bootmgr} displaybootmenu no

:: Disabilita le opzioni avanzate
bcdedit /set {globalsettings} advancedoptions false

:: Imposta la politica dello stato di avvio per ignorare tutti i fallimenti
bcdedit /set {default} bootstatuspolicy IgnoreAllFailures

:: Disabilita il ripristino di Windows
bcdedit /set {default} recoveryenabled No

echo.
echo Le impostazioni BCD sono state aggiornate correttamente.
echo È consigliabile riavviare il computer per applicare le modifiche.
echo ======================================================
pause
