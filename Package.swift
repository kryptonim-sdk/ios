// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Kryptonim",
  platforms: [
    .iOS(.v13)
  ],
  products: [
    .library(
      name: "Kryptonim",
      targets: ["Kryptonim"]
    ),
  ],
  targets: [
    .target(
      name: "Kryptonim",
      dependencies: [],
      path: "Sources"
    ),
    .testTarget(
      name: "KryptonimTests",
      dependencies: ["Kryptonim"],
      path: "Tests"
    ),
  ]
)
