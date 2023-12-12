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
        .binaryTarget(name: "MLImage", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/MLImage.xcframework.zip", checksum: "7b135225ef34e5c8f0d525fc8ea964ce7caab5c50d9b73eb8f80cd9106199331"),
        .binaryTarget(name: "MLKitBarcodeScanning", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/MLKitBarcodeScanning.xcframework.zip", checksum: "7d4f513f7538d7d4fa64861b9adb31eaa13c78d664e8bf2f919cd88a504eb3d8"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/MLKitCommon.xcframework.zip", checksum: "a765d833bb2454715b99804bb6ce760221d3a88a221b76e72f501865c1df0854"),
        .binaryTarget(name: "MLKitVision", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/MLKitVision.xcframework.zip", checksum: "8690bc2476ae37804d06d9422f71812b4a572be7940aada35421c644e5a21697"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/GoogleToolboxForMac.xcframework.zip", checksum: "1d592b9b0413a935cf2e8b49fda90e4692fc5706f53ade1eee9e0776532d1b50"),
        .binaryTarget(name: "GoogleUtilitiesComponents", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/GoogleUtilitiesComponents.xcframework.zip", checksum: "fbe02e03ee8b1c3a51fdc954d0ba7dead5b8d68125372af72ceea26586764bbc"),
        .binaryTarget(name: "Protobuf", url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.2/Protobuf.xcframework.zip", checksum: "f8398df25b3ad9a29e83de13f2ad691fcf33bf6c57681791aac773de8b78ce5e"),
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
