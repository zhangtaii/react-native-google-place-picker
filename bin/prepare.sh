#!/bin/sh

echo "Preparing to link react-native-google-place-picker for iOS"

echo "Checking CocoaPods..."
has_cocoapods=`which pod >/dev/null 2>&1`
if [ -z "$has_cocoapods" ]
then
    echo "CocoaPods already installed"
else
    echo "Installing CocoaPods..."
    gem install cocoapods
fi
