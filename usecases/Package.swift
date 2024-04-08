// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "usecases",
    products: [
        .library(
            name: "usecases",
            targets: ["usecases"]),
    ],
    dependencies: [.package(name: "domain", path: "domain"), .package(name: "data", path: "data")],
    targets: [
        .target(
            name: "usecases",
            dependencies: [.byName(name: "domain"), .byName(name: "data")])
    ]
)
