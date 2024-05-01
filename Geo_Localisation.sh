#!/bin/bash
# Created by Emre Uydu - Infrastructure System Engineer
# emreuydu@gmail.com
# You can use this script to determine geo location of target device(s)
# The script will apply force logout if unapproved location detected. 
# Contact to me for more info

CompanyName=$4
declare -a ApprovedCountryCode=($5)
declare -a ApprovedState=($6)
declare -a ApprovedCity=($7)

countryCode=$(/usr/bin/curl ipinfo.io -s | awk '/"country": / { print $NF }' | tr -d ' ",')
region=$(/usr/bin/curl ipinfo.io -s | awk '/"region": / { print $NF }' | tr -d ' ",')
city=$(/usr/bin/curl ipinfo.io -s | awk '/"city": / { print $NF }' | tr -d ' ",')

if [[ "${ApprovedCountryCode[@]}" =~ "$countryCode" ]]; then
	
	echo "Allowed Location"
else
	/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -defaultButton 1 -description "$CompanyName permits the use of devices only in approved regions.

It has been detected that your device is being used in a different country. You must obtain approval for use.
This window will close after 5 minutes and you will be logged out. You can log out by clicking the OK button.

Please contact your security team." -title "Warning" -icon "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertStopIcon.icns" -windowType utility -button1 "OK" -timeout 300
	
	sudo pkill loginwindow
fi

if [[ "${ApprovedState[@]}" =~ "$region" ]]; then
	
	echo "Allowed Location"
else
	/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -defaultButton 1 -description "$CompanyName permits the use of devices only in approved regions.

It has been detected that your device is being used in a different state. You must obtain approval for use.
This window will close after 5 minutes and you will be logged out. You can log out by clicking the OK button.

Please contact your security team." -title "Warning" -icon "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertStopIcon.icns" -windowType utility -button1 "OK" -timeout 300
	
	sudo pkill loginwindow
fi

if [[ "${ApprovedCity[@]}" =~ "$city" ]]; then
	
	echo "Allowed Location"
else
	/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -defaultButton 1 -description "$CompanyName permits the use of devices only in approved regions.

It has been detected that your device is being used in a different city. You must obtain approval for use.
This window will close after 5 minutes and you will be logged out. You can log out by clicking the OK button.

Please contact your security team." -title "Warning" -icon "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertStopIcon.icns" -windowType utility -button1 "OK" -timeout 300
	
	sudo pkill loginwindow
fi

