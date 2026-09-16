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
            from: "13.4.0"
        ),
        .package(
            url: "https://github.com/prebid/prebid-mobile-ios.git",
            from: "3.3.1"
        ),
    ],
    targets: [
        // Aditude core framework
        .binaryTarget(
            name: "AditudeCore",
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.0/AditudeCore.xcframework.zip",
            checksum: "535fd110df1071be96e9a2b54004500d99f9b69eef4a6d0a34a9dd23aea7d092"
        ),

        // Google Mobile Ads Adapter
        .binaryTarget(
            name: "AditudeGMA",
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.0/AditudeGMA.xcframework.zip",
            checksum: "5c89d5964e0624af00aa9533f9c710a8ae51d56312df7bc22f0fbaea6cdd59b8"
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
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.0/AditudePrebid.xcframework.zip",
            checksum: "8de85ebabfc8cc86300076f875a471fb04380666868c2e92c26904d311572bd4"
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
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.0/AditudeAmazon.xcframework.zip",
            checksum: "1d0c44c841b8a5c9d27671ae61e1f18ae2daada65dba04415e0ea28e0f0b1b55"
        ),
        .binaryTarget(
            name: "DTBiOSSDK",
            url: "https://github.com/aditudeinc/ios-sdk/releases/download/1.0.0/DTBiOSSDK.xcframework.zip",
            checksum: "74238a49a34749fbe3b446bf80d6bd0d7b9b80d141f94a8e7f81fa09c80a6344"
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
