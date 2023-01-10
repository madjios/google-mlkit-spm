// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "MLKitSPM",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "MLKitBarcodeScanning",
            targets: ["MLKitBarcodeScanning", "MLImage", "MLKitVision", "Common"])
    ],
    dependencies: [
        .package(url: "https://github.com/google/promises.git", from: "2.1.1"),
        .package(url: "https://github.com/google/GoogleDataTransport.git", from: "9.2.0"),
        .package(url: "https://github.com/google/GoogleUtilities.git", from: "7.7.1"),
        .package(url: "https://github.com/google/gtm-session-fetcher.git", from: "3.1.0"),
        .package(url: "https://github.com/firebase/nanopb.git", .upToNextMinor(from: "2.30909.0")),
    ],
    targets: [
        .binaryTarget(name: "MLImage",
                      path: "xcframeworks_output/MLImage.xcframework"),
        .binaryTarget(name: "MLKitBarcodeScanning",
                      path: "xcframeworks_output/MLKitBarcodeScanning.xcframework"),
        .binaryTarget(name: "MLKitCommon",
                      path: "xcframeworks_output/MLKitCommon.xcframework"),
        .binaryTarget(name: "MLKitVision",
                      path: "xcframeworks_output/MLKitVision.xcframework"),
        .binaryTarget(name: "GoogleToolboxForMac",
                      path: "xcframeworks_output/GoogleToolboxForMac.xcframework"),
        .binaryTarget(name: "GoogleUtilitiesComponents",
                      path: "xcframeworks_output/GoogleUtilitiesComponents.xcframework"),
        .binaryTarget(name: "Protobuf",
                      path: "xcframeworks_output/Protobuf.xcframework"),
        .target(
            name: "Common",
            dependencies: [
                "MLKitCommon",
                "GoogleToolboxForMac",
                "GoogleUtilitiesComponents",
                "Protobuf",
                .product(name: "GULAppDelegateSwizzler", package: "GoogleUtilities"),
                .product(name: "GULEnvironment", package: "GoogleUtilities"),
                .product(name: "GULISASwizzler", package: "GoogleUtilities"),
                .product(name: "GULLogger", package: "GoogleUtilities"),
                .product(name: "GULMethodSwizzler", package: "GoogleUtilities"),
                .product(name: "GULNSData", package: "GoogleUtilities"),
                .product(name: "GULNetwork", package: "GoogleUtilities"),
                .product(name: "GULReachability", package: "GoogleUtilities"),
                .product(name: "GULUserDefaults", package: "GoogleUtilities"),
                .product(name: "GTMSessionFetcher", package: "gtm-session-fetcher"),
                .product(name: "GoogleDataTransport", package: "GoogleDataTransport"),
                .product(name: "nanopb", package: "nanopb"),
                .product(name: "FBLPromises", package: "promises"),
            ]),
    ]
)
