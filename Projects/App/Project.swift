import ProjectDescription
import ProjectDescriptionHelpers
import TemplatePlugin

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
            sources: .sources,
            resources: .resources,
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
            sources: .unitTests,
            resources: [],
            dependencies: [.target(name: "TuistTemplateV1")]
        ),
    ]
)
