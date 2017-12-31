# Henry

Henry is a Simple Log Monitor Tool for iOS App.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Features

- [x] Logging print output

## Requirements

- iOS 10.0+
- Xcode 9.0+
- Swift 4.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Henry into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'

target '<Your Target Name>' do
  use_frameworks!

  # Add this line
  pod 'Henry', :git => 'https://github.com/watanabetoshinori/Henry.git', :branch => 'master'

end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Henry into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "watanabetoshinori/Henry"
```

Run `carthage update` to build the framework and drag the built `Henry.framework` into your Xcode project.

## Usage

### Show Main Panel

In your AppDelegate:

```swift
import Henry

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {

    Henry.enabled()
    
    return true
}
```

In your ViewController:

```swift
Henry.show()
```

You can see the sample code from the [Example](https://github.com/watanabetoshinori/Henry/tree/master/Example) directory.

## License

Henry is released under the MIT license. [See LICENSE](https://github.com/watanabetoshinori/Henry/blob/master/LICENSE) for details.
