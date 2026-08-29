// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let version: Version = "11.31.0-SNAPSHOT-08-29--01-26.git-a127ce2"
let checksum = "670bf66c8a287b6dd9e453804573512bd97be31511e0b2c5e04bed5c9ef88594"
let commonVersion: Version = "24.31.0-SNAPSHOT-08-29--01-26.git-a127ce2"
let coreMapsVersion: Version = "11.31.0-SNAPSHOT-08-29--01-26.git-a127ce2"
let turfVersion: Version = "4.0.0"
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
