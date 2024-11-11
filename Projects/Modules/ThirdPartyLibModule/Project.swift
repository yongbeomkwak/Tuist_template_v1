import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Module.ThirdPartyLibModule.rawValue,
    targets: [
        .implements(module: .module(.ThirdPartyLibModule)),
        .tests(module: .module(.ThirdPartyLibModule), dependencies: [
            .module(target: .ThirdPartyLibModule)
        ])
    ]
)
