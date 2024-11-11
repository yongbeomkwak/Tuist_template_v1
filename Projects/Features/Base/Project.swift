import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.Base.rawValue,
    targets: [
        .interface(module: .feature(.Base)),
        .implements(module: .feature(.Base), dependencies: [
            .feature(target: .Base, type: .interface)
        ]),
        .testing(module: .feature(.Base), dependencies: [
            .feature(target: .Base, type: .interface)
        ]),
        .tests(module: .feature(.Base), dependencies: [
            .feature(target: .Base)
        ]),
        .demo(module: .feature(.Base), dependencies: [
            .feature(target: .Base)
        ])
    ]
)
