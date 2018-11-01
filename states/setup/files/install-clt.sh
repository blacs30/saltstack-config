#!/usr/bin/env bash
if test -f /tmp/clt.dmg; then
    hdiutil attach -quiet /tmp/clt.dmg
    sudo installer -pkg /Volumes/Command\ Line\ Developer\ Tools/Command\ Line\ Tools\ \(macOS\ Mojave\ version\ 10.14\).pkg -target / && echo "Successfully installed Command Line Tooles"
    sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target / && echo "Successfully installed Header files"
    hdiutil detach -quiet /Volumes/Command\ Line\ Developer\ Tools
fi
