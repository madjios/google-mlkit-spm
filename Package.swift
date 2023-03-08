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
        // these binaryTarget will be overriden when GitHub actions run, so do not edit
        .binaryTarget(name: "MLImage", url: "https://github.com/kientux/google-mlkit-spm/releases/download//MLImage.xcframework.zip", checksum: "59b78827f50b94e2fa0551cd22e87cd1c8fc88251b1b98ad632aed02cdab9ad2"),
        .binaryTarget(name: "MLKitBarcodeScanning", url: "https://github.com/kientux/google-mlkit-spm/releases/download//MLKitBarcodeScanning.xcframework.zip", checksum: "2fd634d76fec8cfaa96dc3030ba9a36ae4547a03c94b52ca02bc11f928cb3621"),
        .binaryTarget(name: "MLKitCommon", url: "https://github.com/kientux/google-mlkit-spm/releases/download//MLKitCommon.xcframework.zip", checksum: "2e812b1056a755e84a16d896bfe31196b731fff5ed81dbcb568b68751303b0bd"),
        .binaryTarget(name: "MLKitVision", url: "https://github.com/kientux/google-mlkit-spm/releases/download//MLKitVision.xcframework.zip", checksum: "fbbb226c552c8410dc68d10daf472ad15e9561f1eb49be6d099933436cbe912f"),
        .binaryTarget(name: "GoogleToolboxForMac", url: "https://github.com/kientux/google-mlkit-spm/releases/download//GoogleToolboxForMac.xcframework.zip", checksum: "05c3b8ff82c2ebf42372dbee110c87da14bad9f42f5f2d549c4cf7f2b250e661"),
        .binaryTarget(name: "GoogleUtilitiesComponents", url: "https://github.com/kientux/google-mlkit-spm/releases/download//GoogleUtilitiesComponents.xcframework.zip", checksum: "16f1aa5d93387c74a286f1b9da878dcb46f1a181ad2ec8a7a74ab9e3c03f99dc"),
        .binaryTarget(name: "Protobuf", url: "https://github.com/kientux/google-mlkit-spm/releases/download//Protobuf.xcframework.zip", checksum: "b63cee269f79836bcfa302a7b76d53acfe083d91d2a0248989fb88c3b448d1aa"),
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
