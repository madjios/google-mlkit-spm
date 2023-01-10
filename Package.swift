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
                      checksum: "870712151147cd847c05ccb54cda5f52d074bca34e93569cada083545847a4a1"),
        .binaryTarget(name: "MLKitBarcodeScanning",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/MLKitBarcodeScanning.xcframework.zip",
                      checksum: "dd91202c31157147e7f6efb2c71dc92f28c5f67840161a40550462c6259fd2a1"),
        .binaryTarget(name: "MLKitCommon",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/MLKitCommon.xcframework.zip",
                      checksum: "68532ae539a6f2afb258807eae0c220cd3bbf7e66556c52f4c353d2f331270af"),
        .binaryTarget(name: "MLKitVision",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/MLKitVision.xcframework.zip",
                      checksum: "5bb9f69ac2e9830d998aad7318607c15d1949bb5028d47620bc80c3a067151a7"),
        .binaryTarget(name: "GoogleToolboxForMac",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/GoogleToolboxForMac.xcframework.zip",
                      checksum: "c575ffd258b0b7bc035214d58c41289f56791eb65d1f9426c7532876b5929c75"),
        .binaryTarget(name: "GoogleUtilitiesComponents",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/GoogleUtilitiesComponents.xcframework.zip",
                      checksum: "87701534858bc944851af0be7bb5104bf5363d3b45658badc5d9c0e9502d5b19"),
        .binaryTarget(name: "Protobuf",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/Protobuf.xcframework.zip",
                      checksum: "872dea20d58bd8f9f1335f372d46d1b882f3d04f2de9e3d1a9441b84cd42b217"),
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
