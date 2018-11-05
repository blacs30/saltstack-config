#!/usr/bin/env bash
set -e

curl -s http://trials2.adobe.com/AdobeProducts/PHSP/13/osx10/Photoshop_13_LS16.dmg -A "Fake" --cookie "MM_TRIALS=1234" -o /tmp/ps6.dmg

if test -f /tmp/ps6.dmg; then
    if [ "$(openssl sha256 /tmp/ps6.dmg | awk '{print $2}')" == "f377a661660a5b00c46ef71dd5a835989d1374ed97bb891e9bdf98fa3a686a5e" ];
        then
            hdiutil attach -quiet /tmp/ps6.dmg
            sudo /Volumes/Adobe\ Photoshop\ CS6/Adobe\ Photoshop\ CS6/Install.app/Contents/MacOS/Install --mode=silent --deploymentFile=/Volumes/Adobe\ Photoshop\ CS6/Adobe\ Photoshop\ CS6/Deployment/en_US_Deployment.xml
            hdiutil detach -quiet /Volumes/Adobe\ Photoshop\ CS6
        else
            return 1
    fi
fi

