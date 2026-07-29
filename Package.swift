// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "Aditude",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "AditudeCore", targets: ["AditudeCore"]),
        .library(name: "AditudeGMA", targets: ["AditudeGMA", "AditudeGMADependencies"]),
        .library(name: "AditudePrebid", targets: ["AditudePrebid", "AditudePrebidDependencies"]),
        .library(name: "AditudeAmazon", targets: ["AditudeAmazon", "DTBiOSSDK", "AditudeAmazonDependencies"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads",
            exact: "13.2.0"
        ),
        .package(
            url: "https://github.com/prebid/prebid-mobile-ios.git",
            exact: "3.3.1"
        ),
    ],
    targets: [
        // Aditude core framework
        .binaryTarget(
            name: "AditudeCore",
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/0.0.1-beta/AditudeCore.xcframework.zip",
            checksum: "af5d244dc078e47e4e29d4d858447637b577cb6e255722ecd3ceea8519df430e"
        ),

        // Google Mobile Ads Adapter
        .binaryTarget(
            name: "AditudeGMA",
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/0.0.1-beta/AditudeGMA.xcframework.zip",
            checksum: "1339893d0b9a20763502a248489e310fd57ad092fe7e7dd7b3f9d195b8293545"
        ),
        .target(
            name: "AditudeGMADependencies",
            dependencies: [
                "AditudeCore",
                "AditudeGMA",
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ],
            path: "Sources/AditudeGMADependencies"
        ),

        // Prebid Mobile Adapter
        .binaryTarget(
            name: "AditudePrebid",
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/0.0.1-beta/AditudePrebid.xcframework.zip",
            checksum: "f923797c192945faaf3a2d1af88f98443865e5629bacd16fa6c453466b994bc7"
        ),
        .target(
            name: "AditudePrebidDependencies",
            dependencies: [
                "AditudeCore",
                "AditudePrebid",
                .product(name: "PrebidMobile", package: "prebid-mobile-ios"),
            ],
            path: "Sources/AditudePrebidDependencies"
        ),

        .binaryTarget(
            name: "AditudeAmazon",
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/0.0.1-beta/AditudeAmazon.xcframework.zip",
            checksum: "f4ff9a48d96a35e850c42e64ca8c0a99a5ce2a46b0ed6dbecaf2e1cb1ada3005"
        ),
        .binaryTarget(
            name: "DTBiOSSDK",
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/0.0.1-beta/DTBiOSSDK.xcframework.zip",
            checksum: "38b4a259225e09a6d799ecd0ec834315aa4b116058f4c76ba0f9d16caab80108"
        ),
        .target(
            name: "AditudeAmazonDependencies",
            dependencies: [
                "AditudeCore",
                "AditudeAmazon",
                "DTBiOSSDK"
            ],
            path: "Sources/AditudeAmazonDependencies"
        )
    ]
)
