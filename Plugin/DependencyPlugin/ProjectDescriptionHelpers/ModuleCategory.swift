import Foundation

public enum ModuleCategory {
    case feature(Feature)
    case module(Module)
    case domain(Domain)
    case userInterface(UserInterface)
    
}

extension ModuleCategory: ModularPathConvertable {
    public func targetName(type: MoudlarTargetType) -> String {
        switch self {
        case let .feature(module as any ModularPathConvertable),
            let .module(module as any ModularPathConvertable),
            let .domain(module as any ModularPathConvertable),
            let .userInterface(module as any ModularPathConvertable):
            return module.targetName(type: type)
        }
    }
}

public extension ModuleCategory {
    enum Feature: String, ModularPathConvertable {
        case SampleFeature
    }
}

public extension ModuleCategory {
    enum Module: String, ModularPathConvertable {
        case SampleModule
    }
}

public extension ModuleCategory {
    enum Domain: String, ModularPathConvertable {
        case Sampleomain
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
