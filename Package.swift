// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GooglePlaces",
    products: [
        .library(name: "GooglePlaces", targets: ["GooglePlacesWrapper"]),
    ],
    targets: [
        .binaryTarget(
            name: "GooglePlaces",
            path: "GooglePlaces.xcframework.zip"
        ),
        .target(
            name: "GooglePlacesWrapper",
            dependencies: [
                .target(name: "GooglePlaces"),
            ],
            path: "GooglePlaces",
            sources: ["dummy.m"],
            resources: [
                 .copy("Resources/GooglePlaces.bundle")
            ],
            publicHeadersPath: "Sources"
        )
    ]
)
