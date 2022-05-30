# OverwatchFirewall
This batch script uses the Firewall-Manager PowerShell module to import the rules required to block all connections to the defined IP addresses in the JSON

## Instructions
- Download the files from here: https://github.com/Lyceris-chan/OverwatchFirewall/archive/refs/heads/main.zip
- Extract the files into a folder
- Run the OverwatchFirewall.bat script as ADMIN

## Issues
- There shouldn't be any unless Blizzard changes their server IP's in that case please use (control + shift + n) in game and provide the IP address mentioned in a github issue so I can update the rules.
- If you are partied with an EU player and they do not have the EU servers blocked it will put you in an EU server still - Playing with an NA person does not have this issue of course (unless an NA person gets put into an EU lobby) - if this happens somehow just disable the rules quickly and you're good to go.

## Optional configuration
OverwatchFirewallConfigurator.bat: this script allows you to enable, disable and remove the firewall rules added by OverwatchFirewall.bat

## Credits
Thanks to @A10Nerd on twitter for the IP addresses

## Last update:
30/05/2022
