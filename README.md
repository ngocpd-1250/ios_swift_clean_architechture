# ios clean architechture

## Build and Runtime Requirements
- Xcode 14.0 or later
- iOS 12.0 or later
- Swift 5

## Architecture
Clean architecture + MVVM + RxSwift.
###### Overview:
![](https://images.viblo.asia/8a66c4ec-d756-4d00-9938-03eca3deb198.png)

###### Layers:
* Domain Layer = Entities + Use Cases + Repositories Interfaces
* Data Repositories Layer = Entities Data + Repositories Implementations + API (Network) + Persistence DB
* Presentation Layer (MVVM) = ViewModels + Views

###### Dependency Direction:
![](https://images.viblo.asia/e9d699f2-5421-445e-abf5-1a61cc76e9e8.png)
***Note*: Domain Layer should not include anything from other layers (e.g Presentation — UIKit or SwiftUI or Data Layer — API, DB..)

## Installation
Clone this repository
```bash
git clone git@github.com:ngocpd-1250/ios_swift_clean_architechture.git
```

Cocoapods
```bash
- Install Cocoapods `brew install cocoapods`.
```

Xcodegen
```bash
 - Install xcodegen `brew install xcodegen`
 - xcodegen generate
```

Add R.generated.swift:

- Move to `Utils/Resources` folder -> Right click -> Add files to clean_architechture... -> Add `R.generated.swift`

Open `.xcworkspace` file in Xcode

- The command above will generate a .xcworkspace file (*.xcworkspace), which should then be opened in Xcode.

Run the Xcode project

- To run the Xcode project, you can click the “Play” (Run) button on the top left corner, or you can simply press Command + R. Make sure you select which specific device or simulator you want the app to run on since the Generic iOS Device won’t work.

## Build environment
- Dev (QA)
- Staging (UAT)
- Production

## UnitTest coverage:

- Install `slather`: https://github.com/SlatherOrg/slather
- Run command: `slather`
![Screenshot 2023-03-13 at 14.31.02.png](https://user-images.githubusercontent.com/49447154/224642648-4c6a9346-e6a8-4b40-ab54-6a8aeff265fc.png)
