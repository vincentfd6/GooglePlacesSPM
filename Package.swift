// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GooglePlaces",
    products: [
        .library(name: "GooglePlacesStatic", type: .static, targets: ["GooglePlacesWrapper"]),
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
            path: "GooglePlacesWrapper",
            resources: [
                 .copy("Resources/GooglePlaces.bundle")
            ],
            linkerSettings: [
                .linkedLibrary("c++"),
                .linkedLibrary("z"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreLocation"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("UIKit"),
           ]
        )
    ]
)
