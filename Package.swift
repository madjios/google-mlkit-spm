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
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/MLImage.xcframework.zip",
                      checksum: "214ef34798b32a89586256c8a0cf4cf28db090346dcd50e6599af6597c35221d"),
        .binaryTarget(name: "MLKitBarcodeScanning",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/MLKitBarcodeScanning.xcframework.zip",
                      checksum: "c8b7eced495c7ea96c7327ef0d0cdf0209bbefd5abfbc2817e408d4ec43dabc6"),
        .binaryTarget(name: "MLKitCommon",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/MLKitCommon.xcframework.zip",
                      checksum: "a5a333b5eabc2c94db09850a47b3f7db1b90bb5277b7272d30d9042b2a8d4cb7"),
        .binaryTarget(name: "MLKitVision",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/MLKitVision.xcframework.zip",
                      checksum: "f378530dec62789ea2627224598318e520d17fe5cf79c39f1c9c5a58ae8c1ee1"),
        .binaryTarget(name: "GoogleToolboxForMac",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/GoogleToolboxForMac.xcframework.zip",
                      checksum: "52cd28f3ce9c3a7a161dc7bca0ae57d7e89ce827fc06e7663648b14bdec59ea8"),
        .binaryTarget(name: "GoogleUtilitiesComponents",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/GoogleUtilitiesComponents.xcframework.zip",
                      checksum: "5f214ef39f8918795c41c4b513ca3024e3ac1e1b31f689f66f6029c711eb66e3"),
        .binaryTarget(name: "Protobuf",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/Protobuf.xcframework.zip",
                      checksum: "27eee18fb9749f9b69ab7ea1cd449be245f1ef79e4458805d2a93f6e071be830"),
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
