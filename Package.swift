// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let version: Version = "11.37.0-SNAPSHOT-11-26--01-23.git-9c12421"
let checksum = "a2f6cfb024f8d050f18bf33e9dc32b781ee18fccfdbe1244b995335bac2e9e3c"
let commonVersion: Version = "24.37.0-SNAPSHOT-11-26--01-23.git-9c12421"
let coreMapsVersion: Version = "11.37.0-SNAPSHOT-11-26--01-23.git-9c12421"
let turfVersion: Version = "4.1.0"
let releaseType = "snapshots"

let package = Package(
    name: "MapboxMaps",
    // Maps SDK doesn't support macOS but declared the minimum macOS requirement with downstream deps to enable `swift run` cli tools
    platforms: [.iOS(.v14), .macOS(.v10_15), .visionOS(.v1)],
    products: [
        .library(
            name: "MapboxMaps",
            targets: ["MapboxMapsWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/mapbox/turf-swift.git", exact: turfVersion),
        .package(url: "https://github.com/mapbox/mapbox-core-maps-ios.git", exact: coreMapsVersion),
        .package(url: "https://github.com/mapbox/mapbox-common-ios.git", exact: commonVersion),
    ],
    targets: [
        .target(
            name: "MapboxMapsWrapper",
            dependencies: [
                "MapboxMaps",
                .product(name: "Turf", package: "turf-swift"),
                .product(name: "MapboxCoreMaps", package: "mapbox-core-maps-ios"),
                .product(name: "MapboxCommon", package: "mapbox-common-ios")
            ]
        ),
        .binaryTarget(
            name: "MapboxMaps",
            url: "https://api.mapbox.com/downloads/v2/mobile-maps-ios-binary/\(releaseType)/ios/\(version)/MapboxMaps.xcframework.zip",
            checksum: checksum
        )
    ]
)
