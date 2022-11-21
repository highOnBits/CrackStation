# CrackStation

## Description
This package decrypts a given unsalted password which matches the regex `[A-Za-z0-9?!]{1,3}$` and is encrypted using SHA1 or SHA256.

## Overview 
This swift package consists of an API which can dycrypt any SHA1 or SHA256 encrypted unsalted password provided it is a combination of characters Capital A to Capital Z, small a to small z, numbers 0-9 and special characters '?' and '!' and the length is less than or equal to 3. Implementation of this package helps in sunderstanding how encyption works and if it is possible to dycrypt back a one way encyrption algorithm. 

## Mission Statement
The main aim of this package is to understand both ends of security- Encryption and Decryption. The purpose of cracking a password is not to hack anthing but to understand that even if the password is encrypted using ONE-WAY encryption algorithm, it is possible to decrypt the password using reverse engineering, i.e. by encrypting possible passwords and matching against the exisiting password.

## Installation
The [Swift Package Manager](https://www.swift.org/package-manager/) is a tool for managing the distribution of a swift code. It's integrated with the swift build system to automate the process of downloading. compiling, and linking dependencies. 

Add this project on your `Package.swift`

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "git@github.com:highOnBits/Fall22-CS561-Crack-Station.git", majorVersion: from: "2.6.0")
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

The CrackStation class implements a protocol named `Decrypter`, which contains a method named ```public func decrypt(shaHash: String) -> String```. This can be used for wrapping and unwrapping purposes.

```swift
let decrypter: Decrypter
decrypter = CrackStation()
decrypter.decrypt("haHash: "<your_password_to_crack>")
```

## Author
[YATIN KUMAR](https://github.com/highOnBits)
