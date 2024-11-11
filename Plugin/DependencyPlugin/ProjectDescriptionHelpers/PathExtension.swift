import ProjectDescription

public extension ProjectDescription.Path {
    static func relativeToFeature(_ path: String) -> Self {
        return .relativeToRoot("Projects/Features/\(path)")
    }
    static func relativeToUserInterfaces(_ path: String) -> Self {
        return .relativeToRoot("Projects/UsertInterfaces/\(path)")
    }
    static func relativeToDomain(_ path: String) -> Self {
        return .relativeToRoot("Projects/Domains/\(path)")
    }
    
    static var scripts: Self {
        return .relativeToRoot("/Scripts")
    }
    
    static var app: Self {
        return .relativeToRoot("Projects/App")
    }
    
    
    static func + (lhs: Self, rhs: String) -> Self {
        return Path(stringLiteral: lhs.pathString + rhs)
    }
}
