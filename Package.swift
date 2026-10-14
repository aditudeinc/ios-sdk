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
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.2/AditudeCore.xcframework.zip",
            checksum: "25da3a78d609f174073115936ac435db44daea02c5088733a42d15251a0b9d1b"
        ),

        // Google Mobile Ads Adapter
        .binaryTarget(
            name: "AditudeGMA",
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.2/AditudeGMA.xcframework.zip",
            checksum: "4098e70c90e3f6aeac402b99c88b98704de902c8db57b586bdf425b2cc6c9323"
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
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.2/AditudePrebid.xcframework.zip",
            checksum: "e5c0e9f587dc8253489b466cc60f34fcbf7f31a666d3ee7ae0c1022d8664c1a4"
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
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.2/AditudeAmazon.xcframework.zip",
            checksum: "bc8e2f48419325dc3e1be67f85ac05583ff9cd61b5c396a5d608e5604278480d"
        ),
        .binaryTarget(
            name: "DTBiOSSDK",
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.2/DTBiOSSDK.xcframework.zip",
            checksum: "e0d3da153a494e8835e5bbe9484026150993b1e5d7102805a1dc4e5f50d76617"
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
