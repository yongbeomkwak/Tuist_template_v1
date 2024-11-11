import Foundation
import ProjectDescription

public extension TargetDependency {
    static func feature(
        target: ModuleCategory.Feature,
        type: MoudlarTargetType = .sources
    ) -> TargetDependency {
        .project(
            target: target.targetName(type: type),
            path: .relativeToFeature(target.rawValue)
        )
    }

    static func userInterface(
        target: ModuleCategory.UserInterface,
        type: MoudlarTargetType = .sources
    ) -> TargetDependency {
        .project(
            target: target.targetName(type: type),
            path: .relativeToUserInterfaces(target.rawValue)
        )
    }
    
    static func domain(
        target: ModuleCategory.Domain,
        type: MoudlarTargetType = .sources
    ) -> TargetDependency {
        .project(
            target: target.targetName(type: type),
            path: .relativeToDomain(target.rawValue)
        )
    }
}
