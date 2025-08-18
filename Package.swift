//
//  Package.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/17/25.
//

// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "MCFunctionDSL",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "MCFunctionDSL",
            targets: ["MCFunctionDSL"]
        ),
    ],
    targets: [
        .target(name: "MCFunctionDSL"),
        .testTarget(
            name: "MCFunctionDSLTests",
            dependencies: ["MCFunctionDSL"]
        ),
    ]
)
