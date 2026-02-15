# Mapbox Maps SDK for iOS - Binary Distribution

This repository contains binary snapshots of the [Mapbox Maps SDK for iOS](https://github.com/mapbox/mapbox-maps-ios) for distribution via Swift Package Manager.

## Overview

The Mapbox Maps SDK for iOS is a public library for displaying interactive, thoroughly customizable maps in native iOS applications. It takes map styles that conform to the [Mapbox Style Specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/), applies them to vector tiles that conform to the [Mapbox Vector Tile Specification](https://github.com/mapbox/vector-tile-spec), and renders them using Metal.

### Prerequisites

Before you can download the binary distribution of Mapbox Maps SDK for iOS, you need to create a token with `DOWNLOAD:READ` scope.
Go to https://account.mapbox.com and click "Create token"

Insert or append the following to `~/.netrc`

```bash
machine api.mapbox.com
  login mapbox
  password <TOKEN WITH DOWNLOAD:READ SCOPE>
```

## Installation

### Swift Package Manager

Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/mapbox/mapbox-maps-ios-binary.git", exact: "11.20.0-SNAPSHOT-02-14--04-52.git-087ce06")
]
```

Or add it through Xcode:

1. File > Add Package Dependencies
2. Enter the repository URL: `https://github.com/mapbox/mapbox-maps-ios-binary.git`
3. Select the version or branch you want to use
4. Add the `MapboxMaps` library to your target

## Documentation

For comprehensive guides, API documentation, and examples, visit the [official Mapbox Maps SDK for iOS documentation](https://docs.mapbox.com/ios/maps/guides/).

## Source Code

This is a binary distribution repository. For the full source code, development guides, and contribution information, visit the [main repository](https://github.com/mapbox/mapbox-maps-ios).

## Examples

For code samples and example implementations, see the [Examples project](https://github.com/mapbox/mapbox-maps-ios/tree/main/Examples.xcodeproj) in the main repository.

## Support

### Report a bug
Please use the [bug template](https://github.com/mapbox/mapbox-maps-ios/issues/new?labels=bug%20%3Abeetle%3A&template=bug.md) in the main repository to report any issues.

### Request a feature
Please use the [feature template](https://github.com/mapbox/mapbox-maps-ios/issues/new?labels=feature%20%3Agreen_apple%3A&template=feature.md) in the main repository for feature requests.

### Questions
- [Mapbox Support](https://docs.mapbox.com/help/)
- [Discord Community](https://discord.gg/UshjQYyDFw)

## License

See [LICENSE.md](LICENSE.md) for details.

## About Binary Distribution

This repository is specifically designed for distributing pre-built binary snapshots of the Mapbox Maps SDK. Using this repository can:

- Speed up build times by using pre-compiled binaries
- Simplify dependency management for projects that don't need to build from source
- Provide stable release snapshots

For development, contributing, or building from source, please use the [main repository](https://github.com/mapbox/mapbox-maps-ios).
