@echo off
title OverwatchFirewall

rem Make sure the script is ran as admin
rem Source: https://stackoverflow.com/a/38856823
net.exe session 1>NUL 2>NUL || (Echo This script requires elevated rights. & Exit /b 1)

netsh advfirewall firewall show rule name="_OverwatchFirewall[EU-BAHRAIN]-INBOUND"
cls
if not ERRORLEVEL 1 (
set status="Installed"
goto status_Check
) else (
set status="Not installed"
goto main
)

:status_Check
netsh advfirewall firewall show rule name="_OverwatchFirewall[EU-BAHRAIN]-INBOUND" | findstr /c:"Enabled:                              Yes"
cls
if not ERRORLEVEL 1 (
set status="Installed & Enabled"
) else (
set status="Installed & Disabled"
)

:main
echo Do you want to install, enable, disable or remove the OverwatchFirewall rule?
echo.
echo Options: install   enable   disable   remove
echo.
echo Current status: %status%
echo.

set /p i=Input: 
if /i "%i%"=="install" (
  set "i="
  goto checkForDuplicate_OverwatchFirewallRule
)
if /i "%i%"=="enable" (
  set "i="
  goto enable_OverwatchFirewallRule
)
if /i "%i%"=="disable" (
  set "i="
  goto disable_OverwatchFirewallRule
)
if /i "%i%"=="remove" (
  set "i="
  goto checkForRules_OverwatchFirewallRule
)

:checkForDuplicate_OverwatchFirewallRule
1>NUL netsh advfirewall firewall show rule name="_OverwatchFirewall[EU-BAHRAIN]-INBOUND"
if not ERRORLEVEL 1 (
goto preventDuplicate_OverwatchFirewallRule
) else (
goto install_OverwatchFirewallRule
)

:checkForRules_OverwatchFirewallRule
1>NUL netsh advfirewall firewall show rule name="_OverwatchFirewall[EU-BAHRAIN]-INBOUND"
if not ERRORLEVEL 1 (
goto remove_OverwatchFirewallRule
) else (
goto notFound_OverwatchFirewallRule
)

:preventDuplicate_OverwatchFirewallRule
netsh advfirewall firewall delete rule name="_OverwatchFirewall[EU-BAHRAIN]-INBOUND"
netsh advfirewall firewall delete rule name="_OverwatchFirewall[EU-BAHRAIN]-OUTBOUND"
goto install_OverwatchFirewallRule

:install_OverwatchFirewallRule
netsh advfirewall firewall add rule name="_OverwatchFirewall[EU-BAHRAIN]-INBOUND" dir=in action=block enable=yes remoteip=5.42.168.0-5.42.175.255,5.42.184.0-5.42.191.255,157.175.0.0-157.175.255.255,15.185.0.0-15.185.255.255,15.184.0.0-15.184.255.255 profile=Any
netsh advfirewall firewall add rule name="_OverwatchFirewall[EU-BAHRAIN]-OUTBOUND" dir=out action=block enable=yes remoteip=5.42.168.0-5.42.175.255,5.42.184.0-5.42.191.255,157.175.0.0-157.175.255.255,15.185.0.0-15.185.255.255,15.184.0.0-15.184.255.255 profile=Any
goto installed_OverwatchFirewallRule

:enable_OverwatchFirewallRule
netsh advfirewall firewall set rule name="_OverwatchFirewall[EU-BAHRAIN]-INBOUND" new enable=yes
netsh advfirewall firewall set rule name="_OverwatchFirewall[EU-BAHRAIN]-OUTBOUND" new enable=yes
goto enabled_OverwatchFirewallRule

:disable_OverwatchFirewallRule
netsh advfirewall firewall set rule name="_OverwatchFirewall[EU-BAHRAIN]-INBOUND" new enable=no
netsh advfirewall firewall set rule name="_OverwatchFirewall[EU-BAHRAIN]-OUTBOUND" new enable=no
goto disabled_OverwatchFirewallRule

:remove_OverwatchFirewallRule
netsh advfirewall firewall delete rule name="_OverwatchFirewall[EU-BAHRAIN]-INBOUND"
netsh advfirewall firewall delete rule name="_OverwatchFirewall[EU-BAHRAIN]-OUTBOUND"
goto removed_OverwatchFirewallRule

:installed_OverwatchFirewallRule
cls
echo OverwatchFirewall rules have been installed
pause
exit

:enabled_OverwatchFirewallRule
cls
echo OverwatchFirewall rules have been enabled
pause
exit

:disabled_OverwatchFirewallRule
cls
echo OverwatchFirewall rules have been disabled
pause
exit

:removed_OverwatchFirewallRule
cls
echo OverwatchFirewall rules have been removed
pause
exit

:notFound_OverwatchFirewallRule
cls
echo Couldn't find the OverwatchFirewall rule, maybe you didn't install it yet?
pause
exit
