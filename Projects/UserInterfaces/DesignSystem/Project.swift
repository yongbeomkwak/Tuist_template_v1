import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers
import TemplatePlugin

let project = Project.module(
    name: ModulePaths.UserInterface.DesignSystem.rawValue,
    targets: [
        .implements(
            module: .userInterface(.DesignSystem),
            product: .framework,
            spec: .init(
                resources: .resources,
                dependencies: []
            )
        ),
        .tests(module: .userInterface(.DesignSystem), dependencies: [
            .userInterface(target: .DesignSystem)
        ])
    ]
)
