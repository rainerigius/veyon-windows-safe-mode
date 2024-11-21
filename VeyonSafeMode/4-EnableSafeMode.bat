@echo off
echo Ripristino delle impostazioni BCD predefinite...

bcdedit /set {bootmgr} displaybootmenu yes
bcdedit /set {globalsettings} advancedoptions true
bcdedit /set {default} bootstatuspolicy DisplayAllFailures
bcdedit /set {default} recoveryenabled Yes

echo Le impostazioni BCD sono state ripristinate.
pause
