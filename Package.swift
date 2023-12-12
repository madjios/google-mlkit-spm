// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "MLKitSPM",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "MLKitBarcodeScanning",
            targets: ["MLKitBarcodeScanning", "MLImage", "MLKitVision", "Common"]
        ),
        .library(
            name: "MLKitTextRecognition",
            targets: ["MLImage", "MLKitVision", "Common"]
        ),
        .library(
            name: "MLKitFaceDetection", 
            targets: ["MLImage", "MLKitVision", "Common"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/google/promises.git", from: "2.1.1"),
        .package(url: "https://github.com/google/GoogleDataTransport.git", from: "9.2.0"),
        .package(url: "https://github.com/google/GoogleUtilities.git", from: "7.7.1"),
        .package(url: "https://github.com/google/gtm-session-fetcher.git", from: "3.1.0"),
        .package(url: "https://github.com/firebase/nanopb.git", .upToNextMinor(from: "2.30909.0")),
    ],
    targets: [
        // these binaryTarget will be overriden when GitHub actions run, so do not edit
        .binaryTarget(name: "MLImage", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.5/MLImage.xcframework.zip", checksum: "0ff13b6bd6a8ddbca84c2fd2ecb592a0a659bef6f25b0da5dd5edb02256ac5b2"),
        .binaryTarget(name: "MLKitBarcodeScanning", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.5/MLKitBarcodeScanning.xcframework.zip", checksum: "0dec843f22721a2678d6aae6fa27cd60a56d22ec8cdccbe29319ff3424d4a773"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.5/MLKitCommon.xcframework.zip", checksum: "76c38e37ba8739bc527426a58d475f779e616f2f786f617d4ed4d6411bca2b2f"),
        .binaryTarget(name: "MLKitVision", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.5/MLKitVision.xcframework.zip", checksum: "c75aaa9b5dfe50141924c3c39765e81de99674acb21c576777d7cf64f0fd8fdc"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.5/GoogleToolboxForMac.xcframework.zip", checksum: "cbbb835f40fe43a6ae0af8be62e93475421e3535542368228bbf1ced70dcc37e"),
        .binaryTarget(name: "GoogleUtilitiesComponents", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.5/GoogleUtilitiesComponents.xcframework.zip", checksum: "212ed96113800b7317817cf03e74fef2365619b2b82bad839b33499a985a0137"),
        .binaryTarget(name: "Protobuf", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.5/Protobuf.xcframework.zip", checksum: "853484e833f9a18c0175de01e8dcfa7258dd277620bf6c70857c8f8de4471441"),
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
