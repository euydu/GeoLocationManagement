
# GeoLocationManagement

GeoLocationManagement is a shell script designed to manage geolocation settings on macOS devices. It provides functionality to determine the device's geolocation and implement management actions based on defined policies.

GeoLocationManagement facilitates the management of device geolocation settings, enabling administrators to enforce access control policies and ensure compliance with location-based regulations.

Features

•	Geolocation Detection: Determines the geographical location of the device using IP address or other available means.
•	Policy Enforcement: Implements management actions (e.g., blocking, alerting) based on defined policies for approved or unapproved regions.
## Configuration on JAMF


1.	Open the geolocation_management.sh and upload to your JAMF Environment
2.	Create a new policy
3.	Add script to the policy
4.	Configure parameters

            Parameter -4 : Your company name.
            Parameter -5 : Country Code.
            Parameter -6 : State(s) – You can specify multiple states with comma.
            Parameter -7 : City(ies) – You can specify multiple states with comma.

    
## Screenshots

![App Screenshot](https://snipboard.io/PNYZ0R.jpg)


## Support

For support, email emreuydu@gmail.com channel.


## Authors

- [@euydu](https://www.github.com/euydu)

