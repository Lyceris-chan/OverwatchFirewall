# OverwatchFirewall
This repository contains a batch script which is meant to provide an easily accessible way for users to switch servers in Overwatch, using the Windows Firewall to block all in and outbound traffic to the European and Bahrain Overwatch servers of which the IP-Addresses are defined in OverwatchFirewall.bat

## Installation
- Download the files from here: https://github.com/Lyceris-chan/OverwatchFirewall/archive/refs/heads/main.zip
- Extract OverwatchFirewall.bat into a folder
- Run the OverwatchFirewall.bat script as **Admin**

## Optional configuration
- Run the OverwatchFirewall.bat script as **Admin**
- Select your desired option by entering one of the following options:
> - install: installs the required firewall rules blocking in/outbound connections to the defined IP-addresses
> - enable: re-enables the firewall rules if they were previously disabled
> - disable: disables the firewall rules if they were previously enabled
> - remove: removes the required firewall rules blocking in/outbound connections to the defined IP-addresses

Note: The install command will also update the existing OverwatchFirewall rules with the ones defined in the script, keep in mind that you will have to make sure the script is updated yourself.

## Credits
Thanks to @A10Nerd on twitter for the IP addresses

## Last update / Changelog:
- 30/05/2022: Initial creation
- 01/06/2022: Switch to netsh advfirewall instead of using a third party PowerShell module
- 01/06/2022: Merge OverwatchFirewallConfigurator and OverwatchFirewall into a single script
- 01/06/2022: Rewrote the README
