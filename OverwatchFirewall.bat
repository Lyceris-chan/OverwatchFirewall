@echo off
title OverwatchFirewall
rem Credits to A10Nerd for finding the IP addresses
rem Source: https://www.twitlonger.com/show/n_1sro3g7

rem Make sure the script is ran as admin
rem Source: https://stackoverflow.com/a/38856823
net.exe session 1>NUL 2>NUL || (Echo This script requires elevated rights. & Exit /b 1)

rem Install the Firewall-Manager powershell module
rem (This module is used to import the rules in JSON format for transparency)
Powershell.exe -Command Install-Module -Name Firewall-Manager -Repository PSGallery -Force

rem Change the powershell ExecutionPolicy to Unrestricted since the module isn't signed
Powershell.exe -Command Set-ExecutionPolicy Unrestricted

rem Import the module
Powershell.exe -Command Import-Module Firewall-Manager -Force

rem Download the latest JSON
Powershell.exe -Command Invoke-WebRequest -Uri https://github.com/Lyceris-chan/OverwatchFirewall/raw/main/OverwatchFirewall.json -OutFile OverwatchFirewall.json

rem Import the Firewall rules blocking EU and Bahrain servers (updated last 30/05/2022)
Powershell.exe -Command Import-FirewallRules -JSON "OverwatchFirewall.json"

rem Change the powershell ExecutionPolicy back to default
Powershell.exe -Command Set-ExecutionPolicy Default

rem Uninstall Firewall-Manager powershell module
Powershell.exe -Command Uninstall-Module -Name Firewall-Manager

rem Remove the JSON file
del OverwatchFirewall.json

rem Clear the screen and mention the OverwatchFirewall rules are installed
cls
echo Installed OverwatchFirewall rules.
pause
