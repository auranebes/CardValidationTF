// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "CardValidationTF",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CardValidationTF",
            targets: ["CardValidationTF"]),
    ],
    targets: [
        .target(
            name: "CardValidationTF",
            path: "Sources"
        )
    ],
    swiftLanguageVersions: [.v5]
)
