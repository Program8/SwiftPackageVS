// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MySwiftPackage",
    platforms: [
            .iOS(.v16) // Specifies iOS as a supported platform with a minimum version of iOS 16
        ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MySwiftPackage",
            targets: ["MySwiftPackage"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MySwiftPackage",resources: [
                .process("OurCustomCode/Resources/text.txt")]
        ),
        .testTarget(
            name: "MySwiftPackageTests",
            dependencies: ["MySwiftPackage"]),
    ]
)
