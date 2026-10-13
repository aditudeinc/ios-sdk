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
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.1-alpha2/AditudeCore.xcframework.zip",
            checksum: "8a811b3252584ad4e8adaa3c2e9680cfb35598434aa637947943664c5aa31efb"
        ),

        // Google Mobile Ads Adapter
        .binaryTarget(
            name: "AditudeGMA",
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.1-alpha2/AditudeGMA.xcframework.zip",
            checksum: "cbb064166c4e41cd3f73b22dae09bc7cc027f3b9acb9985b98ae56a55d013f27"
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
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.1-alpha2/AditudePrebid.xcframework.zip",
            checksum: "b937e648fa93bab4694eb88f4714cca94dda6d611cebf76b064a5fc15f3b0b18"
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
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.1-alpha2/AditudeAmazon.xcframework.zip",
            checksum: "a5a1f2ac9585331cd9f6b141d5077cd76001033896996ca80a022fc960006e55"
        ),
        .binaryTarget(
            name: "DTBiOSSDK",
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.1-alpha2/DTBiOSSDK.xcframework.zip",
            checksum: "6807cafe28777bfa6e9fb41886342e4865a9c504088d624669d370b455a98df4"
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
