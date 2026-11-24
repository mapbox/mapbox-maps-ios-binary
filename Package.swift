// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let version: Version = "11.37.0-SNAPSHOT-11-24--01-23.git-a2282c1"
let checksum = "1b956d31f22968a03ed5a19b1758d43baa41bd5bad1cc4ea7202d1e2b6480af5"
let commonVersion: Version = "24.37.0-SNAPSHOT-11-24--01-23.git-a2282c1"
let coreMapsVersion: Version = "11.37.0-SNAPSHOT-11-24--01-23.git-a2282c1"
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
