import ProjectDescription

extension InfoPlist {
    static var demoDefulat: InfoPlist = .extendingDefault(with: [
        "UIMainStoryboardFile": "",
        "UILaunchStoryboardName": "LaunchScreen",
        "ENABLE_TESTS": .boolean(true),
    ])
}
