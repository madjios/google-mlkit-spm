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
                      checksum: "94c68a70396651948927e099bd28628f867bdb2d5c45be3df5f816a5a14823f2"),
        .binaryTarget(name: "MLKitBarcodeScanning",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/MLKitBarcodeScanning.xcframework.zip",
                      checksum: "95bb3c79b3ddea45a548c3c3dc0d7a4eb8b1c9d0b0b853f53b44d63593eb5a5e"),
        .binaryTarget(name: "MLKitCommon",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/MLKitCommon.xcframework.zip",
                      checksum: "8384db790f13be7b7adb7ac139c65ed1c0ff16423550ea0535b8a3b5e99d07cc"),
        .binaryTarget(name: "MLKitVision",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/MLKitVision.xcframework.zip",
                      checksum: "213c5827d7a2bb427e545efb4b3e9a68675c3fbfc75c04c6a21b3d2ad807629e"),
        .binaryTarget(name: "GoogleToolboxForMac",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/GoogleToolboxForMac.xcframework.zip",
                      checksum: "1fbfd1ca793a25214b1490442be078a8bb837c93d21113702af8208769ba1754"),
        .binaryTarget(name: "GoogleUtilitiesComponents",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/GoogleUtilitiesComponents.xcframework.zip",
                      checksum: "d85d2ca4c75caba09291077ab66aaa539789e5be094fb89b140c7f33b8ca9458"),
        .binaryTarget(name: "Protobuf",
                      url: "https://github.com/kientux/google-mlkit-spm/releases/download/0.0.1/Protobuf.xcframework.zip",
                      checksum: "32599b9804e724f2067e485470564dd84753888cdcba83a6e5c0433624cafe8c"),
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
