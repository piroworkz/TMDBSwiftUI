// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "data",
    products: [
        .library(
            name: "data",
            targets: ["data"]),
    ],
    dependencies: [Package.Dependency.package(name: "domain", path: "domain")],
    targets: [
        .target(
            name: "data",
            dependencies: [.byName(name: "domain")]),
    ]
)

