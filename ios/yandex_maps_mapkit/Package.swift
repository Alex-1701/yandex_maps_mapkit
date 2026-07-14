// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "yandex_maps_mapkit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "yandex-maps-mapkit",
            targets: ["yandex_maps_mapkit", "YandexMapsMobileResources"]
        ),
    ],
    targets: [
        .target(
            name: "yandex_maps_mapkit",
            dependencies: [
                "YandexMapsMobile",
            ],
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedFramework("CoreLocation"),
                .linkedFramework("UIKit"),
                .linkedFramework("OpenGLES"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("Security"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("DeviceCheck"),
                .linkedFramework("NetworkExtension"),
                .linkedLibrary("resolv"),
                .linkedLibrary("c++"),
                .unsafeFlags(["-ObjC", "-all_load"]),
            ]
        ),
        .binaryTarget(
            name: "YandexMapsMobile",
            url: "https://maps-ios-pods-public.s3.yandex.net/YandexMapsMobile-4.41.0-full-flutter.framework.zip",
            checksum: "7cda0c534c8f4759624ef287029198a5cb095d3fa9c01d4bad3141580e1bb923"
        ),
        .target(
            name: "YandexMapsMobileResources",
            path: "Resources",
            resources: [.process("Contents")]
        ),
    ]
)
