import ProjectDescription

public extension Array where Element == Configuration {
    static let `default`: [Configuration] = [
        .debug(name: .debug),
        .release(name: .release)
//        .debug(name: .debug, xcconfig: .relativeToRoot("Projects/App/XCConfig/Secrets.xcconfig")),
//        .debug(name: .qa, xcconfig: .relativeToRoot("Projects/App/XCConfig/Secrets.xcconfig")),
//        .release(name: .release, xcconfig: .relativeToRoot("Projects/App/XCConfig/Secrets.xcconfig"))
    ]
}

public extension ProjectDescription.ConfigurationName {
    // define custom configuration
   // static let qa = ConfigurationName.configuration("QA")
}
