import ProjectDescription

//typealias SingleValue = [String : Plist.Value]
//typealias ArrayValue = [Plist.Value]
//
//extension Dictionary where Key == String, Value == Plist.Value {
//    enum PlistProperty {
//        case launchStoryboardName(name: String)
//        case sceneManifest(array: ArrayValue)
//        case supportMultipleScenes(flag: Bool)
//        case sceneConfiguration(array: ArrayValue)
//        case windowSceneSession(array: ArrayValue)
//        case configurationName(name: String)
//        case delegateClassName
//        case enableTests(flag: Bool)
//    
//        var singleValue: SingleValue {
//            switch self {
//            case let .launchStoryboardName(name):
//                return ["UILaunchStoryboardName" : Plist.Value.string("\(name).storyboard")]
//            case let .sceneManifest(array):
//                return ["UIApplicationSceneManifest": Plist.Value.array(array)]
//            case let .supportMultipleScenes(flag):
//                return ["UIApplicationSupportsMultipleScenes" : Plist.Value.boolean(flag)]
//            case let .sceneConfiguration(array):
//                return ["UISceneConfigurations": Plist.Value.array(array)]
//            case let .windowSceneSession(array):
//                return ["UIWindowSceneSessionRoleApplication": Plist.Value.array(array)]
//            case let .configurationName(name):
//                return ["UISceneConfigurationName": Plist.Value.string(name)]
//            case .delegateClassName:
//                return ["UISceneConfigurationName": "$(PRODUCT_MODULE_NAME).SceneDelegate"]
//            case let .enableTests(flag):
//                return ["ENABLE_TESTS": Plist.Value.boolean(flag)]
//            }
//            
//        }
//    }
//    
//    func merging(property: PlistProperty) -> Self {
//        var copy = self
//        return  copy.merging(property.singleValue, uniquingKeysWith: {value1, _ in return value1 })
//   }
//    
//}

extension InfoPlist {
    static var demoDefulat: InfoPlist = .extendingDefault(with: [
        "UIMainStoryboardFile": "",
        "UILaunchStoryboardName": "LaunchScreen",
        "ENABLE_TESTS": .boolean(true),
    ])
    
    static var projectDefault: InfoPlist = .extendingDefault(
        with: [
            "UILaunchStoryboardName": "Resources/LaunchScreen",
            "UIApplicationSceneManifest": [
                "UIApplicationSupportsMultipleScenes": false,
                "UISceneConfigurations": [
                    "UIWindowSceneSessionRoleApplication": [
                        [
                            "UISceneConfigurationName": "Default Configuration",
                            "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                        ],
                    ]
                ]
            ],
        ]
    )
}
