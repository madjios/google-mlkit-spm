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
            targets: ["MLKitTextRecognition", "MLImage", "MLKitVision", "Common"]
        ),
        .library(
            name: "MLKitFaceDetection", 
            targets: ["MLKitFaceDetection", "MLImage", "MLKitVision", "Common"]
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
        .binaryTarget(name: "MLImage", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.7/MLImage.xcframework.zip", checksum: "acda6284ab215ca2512f2a7328ac57affda053957ff676eec8bd389291037e07"),
        .binaryTarget(name: "MLKitBarcodeScanning", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.7/MLKitBarcodeScanning.xcframework.zip", checksum: "156899090a9b7e1db0578f0cd3e449ffcf196351fcede21842520c38cdafb9f2"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.7/MLKitCommon.xcframework.zip", checksum: "9ea3262b05aaa56613b7ac64f5ba5daf8faafce17088816408e7b232a67b239c"),
        .binaryTarget(name: "MLKitVision", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.7/MLKitVision.xcframework.zip", checksum: "75e7d33b4aabb15c63bf87de8ca17fa3108bf79750fa2db085bace8ed4811fce"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.7/GoogleToolboxForMac.xcframework.zip", checksum: "366cdaa8e53a0c71a7cbbd99b761d99f3554dcdb18de92747c4112f122e1b4e5"),
        .binaryTarget(name: "GoogleUtilitiesComponents", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.7/GoogleUtilitiesComponents.xcframework.zip", checksum: "2c7c087596874e189345c46f3286464ed50303188fd50837090a2440a53477c2"),
        .binaryTarget(name: "Protobuf", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.7/Protobuf.xcframework.zip", checksum: "b92f5b0979e9694f680d7c01a81d0d2714afde31eca54f6efe79edb57fb50d2e"),
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
