import DependencyPlugin
import EnvironmentPlugin
import ProjectDescription
import ConfigurationPlugin
import TemplatePlugin

// MARK: - Project

extension Target {
    static let projectTarget: Target = .target(
            name: env.name,
            destinations: [.iPhone],
            product: .app,
            productName: env.name,
            bundleId: "\(env.organizationName)",
            deploymentTargets: env.deploymentTargets,
            infoPlist: .file(path: "Support/Info.plist"),
            sources: .sources,
            resources: .resources,
            scripts: generationEnvironment.scripts,
            dependencies: [
                .feature(target: .BaseFeature),
                .domain(target: .BaseDomain),
                .module(target: .ThirdPartyLibModule),
                .userInterface(target: .DesignSystem)
            ],
            settings: .settings(base: .makeProjectSetting(), configurations: .default, defaultSettings: .recommended),
            environmentVariables: [:] // 환경변수 설정
        )
    
    static let projectTestTarget: Target = .target(
            name: "\(env.name)Tests",
            destinations: [.iPhone],
            product: .unitTests,
            bundleId: "\(env.organizationName)Tests",
            deploymentTargets: env.deploymentTargets,
            infoPlist: .default,
            sources: .unitTests,
            dependencies: [
                .target(name: env.name)
            ]
        )
}


// MARK: - Interface
public extension Target {
    static func interface(module: ModulePaths, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .interface
        }
        .toTarget(with: module.targetName(type: .interface), product: .framework)
    }

    static func interface(module: ModulePaths, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(sources: .interface, dependencies: dependencies)
            .toTarget(with: module.targetName(type: .interface), product: .framework)
    }

    static func interface(name: String, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .interface
        }
        .toTarget(with: "\(name)Interface", product: .framework)
    }

    static func interface(name: String, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(sources: .interface, dependencies: dependencies)
            .toTarget(with: "\(name)Interface", product: .framework)
    }
}

// MARK: - Implements
public extension Target {
    static func implements(
        module: ModulePaths,
        product: Product = .staticLibrary,
        spec: TargetSpec
    ) -> Target {
        spec.with {
            $0.sources = .sources
        }
        .toTarget(with: module.targetName(type: .sources), product: product)
    }

    static func implements(
        module: ModulePaths,
        product: Product = .staticLibrary,
        dependencies: [TargetDependency] = []
    ) -> Target {
        TargetSpec(sources: .sources, dependencies: dependencies)
            .toTarget(with: module.targetName(type: .sources), product: product)
    }

    static func implements(
        name: String,
        product: Product = .staticLibrary,
        spec: TargetSpec
    ) -> Target {
        spec.with {
            $0.sources = .sources
        }
        .toTarget(with: name, product: product)
    }

    static func implements(
        name: String,
        product: Product = .staticLibrary,
        dependencies: [TargetDependency] = []
    ) -> Target {
        TargetSpec(sources: .sources, dependencies: dependencies)
            .toTarget(with: name, product: product)
    }
}

// MARK: - Testing
public extension Target {
    static func testing(module: ModulePaths, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .testing
        }
        .toTarget(with: module.targetName(type: .testing), product: .framework)
    }

    static func testing(module: ModulePaths, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(sources: .testing, dependencies: dependencies)
            .toTarget(with: module.targetName(type: .testing), product: .framework)
    }

    static func testing(name: String, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .testing
        }
        .toTarget(with: "\(name)Testing", product: .framework)
    }

    static func testing(name: String, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(sources: .testing, dependencies: dependencies)
            .toTarget(with: "\(name)Testing", product: .framework)
    }
}

// MARK: - Tests
public extension Target {
    static func tests(module: ModulePaths, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .unitTests
        }
        .toTarget(with: module.targetName(type: .unitTest), product: .unitTests)
    }

    static func tests(module: ModulePaths, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(
            sources: .unitTests
        )
        .toTarget(with: module.targetName(type: .unitTest), product: .unitTests)
    }

    static func tests(name: String, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .unitTests
        }
        .toTarget(with: "\(name)Tests", product: .unitTests)
    }

    static func tests(name: String, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(
            sources: .unitTests
        )
        .toTarget(with: "\(name)Tests", product: .unitTests)
    }
}

// MARK: - Demo
public extension Target {
    static func demo(module: ModulePaths, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .demoSources
            $0.settings = .settings(
                base: (spec.settings?.base ?? [:])
                    .merging(["OTHER_LDFLAGS": "$(inherited) -Xlinker -interposable"]),
                configurations: .default,
                defaultSettings: spec.settings?.defaultSettings ?? .recommended
            )
            $0.infoPlist = spec.infoPlist ?? .default
        }
        .toTarget(with: module.targetName(type: .demo), product: .app)
    }

    static func demo(module: ModulePaths, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(
            infoPlist: .demoDefulat,
            sources: .demoSources,
            settings: .settings(
                base: ["OTHER_LDFLAGS": "$(inherited) -Xlinker -interposable"],
                configurations: .default
            )
        )
        .toTarget(with: module.targetName(type: .demo), product: .app)
    }

    static func demo(name: String, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .demoSources
            $0.settings = .settings(
                base: (spec.settings?.base ?? [:])
                    .merging(["OTHER_LDFLAGS": "$(inherited) -Xlinker -interposable"]),
                configurations: .default,
                defaultSettings: spec.settings?.defaultSettings ?? .recommended
            )
            $0.infoPlist = spec.infoPlist ?? .demoDefulat
        }
        .toTarget(with: "\(name)Demo", product: .app)
    }

    static func demo(name: String, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(
            infoPlist: .demoDefulat,
            sources: .demoSources,
            settings: .settings(
                base: ["OTHER_LDFLAGS": "$(inherited) -Xlinker -interposable"],
                configurations: .default
            )
        )
        .toTarget(with: "\(name)Demo", product: .app)
    }
}
