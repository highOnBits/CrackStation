# CrackStation

## Description
This package decrypts a given password which matches the regex `[A-Za-z0-9]{1,2}$` and is encrypted using SHA1 or SHA256. 

## Installation

Add this project on your `Package.swift`

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "git@github.com:highOnBits/Fall22-CS561-Crack-Station.git", majorVersion: from: "2.4.0")
    ]
)
```

Add `CrackStation` dependency under your targets where you want to use the package in `Package.swift`

```swift
    targets: [
        .target(
            dependencies: [
                "CrackStation"
        ])
    ]
        
```

## Usage Example

How to use the package inside your code

```swift
import CrackStation
let crackStation = CrackStation()
crackStation.decrypt(shaHash: "<your_password_to_crack>")
```

The CrackStation class implements a protocol named `Decrypter` which have a method named ```swift public func decrypt(shaHash: String) -> String``` which can be used for wrapping and unwrapping purposes.

```swift
let decrypter: Decrypter
decrypter = CrackStation()
decrypter.decrypt("haHash: "<your_password_to_crack>")
```
