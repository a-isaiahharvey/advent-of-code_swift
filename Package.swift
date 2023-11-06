// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "Advent of Code",
  platforms: [
    .macOS(.v13)
  ],
  products: [
    .library(name: "Advent", targets: ["Advent"]),
    .library(name: "Year2022", targets: ["Year2022"]),

  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-algorithms", from: "1.1.0"),
    .package(url: "https://github.com/apple/swift-crypto", from: "3.1.0"),
  ],
  targets: [

    // MARK: - Advent

    .target(
      name: "Advent",
      dependencies: [
        .product(name: "Algorithms", package: "swift-algorithms"),
        .product(name: "Crypto", package: "swift-crypto"),
      ],
      path: "Advent/Sources",
      swiftSettings: [
        .unsafeFlags(["-enable-bare-slash-regex"])
      ]),

    // MARK: - Year2022

    .target(
      name: "Year2022",
      dependencies: ["Advent"],
      path: "Year2022/Sources",
      swiftSettings: [
        .unsafeFlags(["-enable-bare-slash-regex"])
      ]),

    .testTarget(
      name: "Year2022Tests",
      dependencies: ["Advent", "Year2022"],
      path: "Year2022/Tests",
      resources: [.copy("Inputs")],
      swiftSettings: [
        .unsafeFlags(["-enable-bare-slash-regex"])
      ]),
  ],
  swiftLanguageVersions: [.v5]
)
