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
        .binaryTarget(name: "MLImage", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/MLImage.xcframework.zip", checksum: "0764ee131340a2cef0cc968e6e4bfce4c50154fedec4a085cbbeee63f5c0c588"),
        .binaryTarget(name: "MLKitBarcodeScanning", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/MLKitBarcodeScanning.xcframework.zip", checksum: "a3f52e3cb9ae11d68cf79459b8dc57e5c3818dd57622b3c1bf4a5491e0889891"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/MLKitCommon.xcframework.zip", checksum: "4eac91a37e5730f7b7d1b7ce0acd8bacc0fed8910ac3b3ab28681c65b3cc3d7f"),
        .binaryTarget(name: "MLKitVision", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/MLKitVision.xcframework.zip", checksum: "55a833740417dbd8d7cdb9ff595fc44eea802e4a70c67a21745a6d469b4e8f62"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/GoogleToolboxForMac.xcframework.zip", checksum: "48ac6c3086ddf18444570543152902d924b1b121c7564cbc0cdb87d200f355c8"),
        .binaryTarget(name: "GoogleUtilitiesComponents", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/GoogleUtilitiesComponents.xcframework.zip", checksum: "a93d45f9d6b9f6c4abe12543da6ede80f8b184f2a99200e211e01b82007ccf52"),
        .binaryTarget(name: "Protobuf", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/Protobuf.xcframework.zip", checksum: "ff4d3e859afd5cdd863e9e13fcad8c8f31e14b9658fe9f79a27402ac6c00d8aa"),
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
