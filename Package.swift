// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let version: Version = "11.22.0-SNAPSHOT-03-24--04-59.git-b8d4dff"
let checksum = "3d2d6aedebd4db0b100a43a4709a508a6d6eb1542a77dc8d51bfeaeed0797fe4"
let commonVersion: Version = "24.22.0-SNAPSHOT-03-24--04-59.git-b8d4dff"
let coreMapsVersion: Version = "11.22.0-SNAPSHOT-03-24--04-59.git-b8d4dff"
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
