// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "domain",
    products: [
        .library(
            name: "domain",
            targets: ["domain"]),
    ],
    targets: [
        .target(
            name: "domain")
    ]
)

