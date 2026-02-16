// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let version: Version = "11.20.0-SNAPSHOT-02-16--16-38.git-da7313c"
let checksum = "1d58539cea90c45a96dd8c23d49c3a288efdb5aac5436e5255f908c1afbe20f0"
let commonVersion: Version = "24.20.0-SNAPSHOT-02-16--16-38.git-da7313c"
let coreMapsVersion: Version = "11.20.0-SNAPSHOT-02-16--16-38.git-da7313c"
let turfVersion: Version = "4.0.0"


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
            url: "https://api.mapbox.com/downloads/v2/mobile-maps-ios/snapshots/ios/packages/\(version)/MapboxMaps.zip",
            checksum: checksum
        )
    ]
)
