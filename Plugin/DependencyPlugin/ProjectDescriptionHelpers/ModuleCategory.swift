import Foundation

public enum ModuleCategory {
    case feature(Feature)
    case userInterface(UserInterface)
    case domain(Domain)
}

extension ModuleCategory: ModularPathConvertable {
    public func targetName(type: MoudlarTargetType) -> String {
        switch self {
        case let .feature(module as any ModularPathConvertable),
            let .userInterface(module as any ModularPathConvertable),
            let .domain(module as any ModularPathConvertable):
            return module.targetName(type: type)
        }
    }
}

public extension ModuleCategory {
    enum Feature: String, ModularPathConvertable {
        case BaseFeature
    }
}

public extension ModuleCategory {
    enum Domain: String, ModularPathConvertable {
        case BaseDomain
    }
}


public extension ModuleCategory {
    enum UserInterface: String, ModularPathConvertable {
        case DesignSystem
    }
}

public enum MoudlarTargetType: String {
    case interface = "Interface"
    case sources = ""
    case testing = "Testing"
    case unitTest = "Tests"
    case demo = "Demo"
}

public protocol ModularPathConvertable {
    func targetName(type: MoudlarTargetType) -> String
}

public extension ModularPathConvertable where Self: RawRepresentable {
    func targetName(type: MoudlarTargetType) -> String {
        "\(self.rawValue)\(type.rawValue)"
    }
}
