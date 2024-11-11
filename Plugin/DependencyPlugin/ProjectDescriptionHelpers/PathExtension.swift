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
    static var app: Self {
        return .relativeToRoot("Projects/App")
    }
}