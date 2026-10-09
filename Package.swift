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
            exact: "13.10.0"
        ),
        .package(
            url: "https://github.com/prebid/prebid-mobile-ios.git",
            exact: "3.3.4"
        ),
    ],
    targets: [
        // Aditude core framework
        .binaryTarget(
            name: "AditudeCore",
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.1-alpha1/AditudeCore.xcframework.zip",
            checksum: "d411ec6cdf7c64d2b290a37b319d18e8bb2b4230cd66bb7d347f015e569ad2c7"
        ),

        // Google Mobile Ads Adapter
        .binaryTarget(
            name: "AditudeGMA",
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.1-alpha1/AditudeGMA.xcframework.zip",
            checksum: "ff6074b337084e86ffbc1c4ab8c4c2a0115ab419e8f724ab01dc430e7c62442b"
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
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.1-alpha1/AditudePrebid.xcframework.zip",
            checksum: "67c68bbf057523f46c5c551411234dda7804d5a283d3aaa4ce8d87743019b66e"
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
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.1-alpha1/AditudeAmazon.xcframework.zip",
            checksum: "cafb2135826b807d967b3aaeb89f9c346aaf09cab90abc5f7463dbc7bfb2a05d"
        ),
        .binaryTarget(
            name: "DTBiOSSDK",
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.1-alpha1/DTBiOSSDK.xcframework.zip",
            checksum: "b1f945ff2da406a274536394cbdff97be210f21426b252ecda97534cc8414cc4"
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
