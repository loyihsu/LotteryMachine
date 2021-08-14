// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LotteryMachine",
    products: [
        .library(name: "Crawler", targets: ["Crawler"]),
    ],
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "1.7.4"),
    ],
    targets: [
        .target(name: "Crawler", dependencies: ["SwiftSoup"]),
        .target(name: "LotteryMachine", dependencies: ["Crawler"]),
        .target(name: "Runner", dependencies: ["LotteryMachine"]),
        // .testTarget(name: "CrawlerTests", dependencies: ["Crawler"]),
    ]
)
