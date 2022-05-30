@echo off
title OverwatchFirewallConfigurator

rem Make sure the script is ran as admin
rem Source: https://stackoverflow.com/a/38856823
net.exe session 1>NUL 2>NUL || (Echo This script requires elevated rights. & Exit /b 1)

echo Do you want to enable / disable or remove the OverwatchFirewall rule?
echo.
echo Options: enable   disable   remove

set /p i=Input: 
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
	goto remove_OverwatchFirewallRule
)

:enable_OverwatchFirewallRule
netsh advfirewall firewall set rule name="_OverwatchFirewall[EU-BAHRAIN]-INBOUND new enable=yes
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
