import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "TuistTemplateV1",
    targets: [
        .target(
            name: "TuistTemplateV1",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.TuistTemplateV1",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            scripts: [
                .swiftLint
             ],
            dependencies: []
        ),
        .target(
            name: "TuistTemplateV1Tests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TuistTemplateV1Tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "TuistTemplateV1")]
        ),
    ]
)
