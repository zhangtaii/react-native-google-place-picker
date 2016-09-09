
# react-native-google-place-picker

React Native Wrapper of Google Place Picker for iOS + Android.

iOS | Android
------- | ----
<img title="iOS" src="https://i.imgur.com/whMT9CD.png" width="350"> | <img title="Android" src="https://i.imgur.com/ltkmP1k.png" width="350">

## Table of contents
- [Install](#install)
  - [iOS](#ios)
  - [Android](#android)
- [Usage](#usage)
  - [Example](#example)
- [Response object](#the-response-object)

## Install

`npm install react-native-google-place-picker --save`

Then you must install the native dependencies. You can use `rnpm` (now part of `react-native` core) to add native dependencies automatically:

`react-native link`

 or link manually like so: 

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-google-place-picker` and add `RNGooglePlacePicker.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNGooglePlacePicker.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Inside your `ios` directory add a file named `Podfile` with the following [content](https://github.com/q6112345/react-native-google-place-picker/blob/master/Podfile.template)
6. Run `pod install --project-directory=ios` in the project root path.
7.  At the top of your `AppDelegate.m`:

    ```objc
    #import <GoogleMaps/GoogleMaps.h>
    #import <GooglePlaces/GooglePlaces.h>
    ```
    And then in your AppDelegate implementation, Add the following to your application:didFinishLaunchingWithOptions, replace `YOUR_API_KEY`:

    ```
    NSString *kAPIKey = @"YOUR_API_KEY";
    [GMSPlacesClient provideAPIKey:kAPIKey];
    [GMSServices provideAPIKey:kAPIKey];
    ```

8. Run `react-native run-ios`

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNGooglePlacePickerPackage;` to the imports at the top of the file
  - Add `new RNGooglePlacePickerPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:

```groovy
include ':react-native-google-place-picker'
project(':react-native-google-place-picker').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-google-place-picker/android')
```

3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:

```groovy
compile project(':react-native-google-place-picker')
```

4. Add permisson and your `YOUR_API_KEY` to your manifest file:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example"
    android:versionCode="1"
    android:versionName="1.0">

    ...

    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />

    ...

    <application>

      ...

      <meta-data
          android:name="com.google.android.geo.API_KEY"
          android:value="YOUR_API_KEY" />

      ...

    </application>
</manifest>
```

## Usage
```javascript
import RNGooglePlacePicker from 'react-native-google-place-picker';

RNGooglePlacePicker.show((response) => {
  if (response.didCancel) {
    console.log('User cancelled GooglePlacePicker');
  }
  else if (response.error) {
    console.log('GooglePlacePicker Error: ', response.error);
  }
  else {
    this.setState({
      location: response
    });
  }
})
```
### Example
* A fully working [example](https://github.com/q6112345/react-native-google-place-picker/tree/master/example)

### The Response Object

key | type | Description
------ | ---- | ------- | ----------------------
didCancel | boolean | Informs you if the user cancelled the process
error | string | Contains an error message, if there is one
address | string/null | The formated address of selected location, null if not available
latitude | number | The latitude value of selected location
longitude | number | The longitude value of selected location

### Credits
Thanks following repositories' inspiration/help:

* [react-native-create-library](https://github.com/frostney/react-native-create-library)
* [react-native-image-picker](https://github.com/marcshilling/react-native-image-picker)
* [react-native-maps](https://github.com/lelandrichardson/react-native-maps)
* [react-native-lock](https://github.com/auth0/react-native-lock)


### License

Code in this git repo is licensed MIT.
