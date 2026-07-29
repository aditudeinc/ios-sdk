# Aditude iOS SDK

Modular Swift Package distribution of the Aditude iOS SDK. Each ad network
adapter is its own library product, so you only pull in what you actually use.

## Requirements

- iOS 13.0+
- Swift Package Manager

## Installation

Add the package in Xcode via **File → Add Package Dependencies...** and enter:

```
https://github.com/aditudeinc/ios-sdk.git
```

Or add it to your `Package.swift`:

```swift
.package(url: "https://github.com/aditudeinc/ios-sdk.git", exact: "0.0.1-beta")
```
