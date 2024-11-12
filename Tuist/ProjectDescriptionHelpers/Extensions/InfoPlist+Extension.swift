import ProjectDescription

//typealias SingleDictValue = [String : Plist.Value]
//typealias NestedDictionaryValue = [String:[String: Plist.Value]]
//
//extension SingleDictValue {
//    func merging(value: SingleDictValue) -> Self {
//        var copy = self
//        return  copy.merging(value, uniquingKeysWith: {value1, _ in return value1 })
//   }
//}
//
//extension Plist.Value {
//
// static func nestDict(_ data: NestedDictionaryValue) -> Plist.Value {
//    #warning(추후 구현)
//    }
//}
//
//extension InfoPlist {
//    enum PlistProperty {
//        case launchStoryboardName(name: String) //
//        case sceneManifest(data: ArrayDictionaryValue)
//        case supportMultipleScenes(flag: Bool)
//        case sceneConfiguration(data: ArrayDictionaryValue)
//        case windowSceneSession(data: ArrayDictionaryValue)
//        case configurationName(name: String)
//        case delegateClassName
//        case enableTests(flag: Bool)
//    
//        var singleValue: SingleDictValue {
//            switch self {
//            case let .launchStoryboardName(name):
//                return ["UILaunchStoryboardName" : Plist.Value.string("\(name)")]
//            case let .sceneManifest(data):
//                return ["UIApplicationSceneManifest": .arrayDict(data)]
//            case let .supportMultipleScenes(flag):
//                return ["UIApplicationSupportsMultipleScenes" : Plist.Value.boolean(flag)]
//            case let .sceneConfiguration(data):
//                return ["UISceneConfigurations": .arrayDict(data)]
//            case let .windowSceneSession(data):
//                return ["UIWindowSceneSessionRoleApplication": .arrayDict(data)]
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
//}

extension InfoPlist {
    
    static var demoDefulat: InfoPlist = .extendingDefault(with: [
        "UIMainStoryboardFile": "",
        "UILaunchStoryboardName": "LaunchScreen",
        "ENABLE_TESTS": .boolean(true),
    ])
    
//    static var windowSession: SingleDictValue = PlistProperty.windowSceneSession(data: [
//        InfoPlist.PlistProperty.configurationName(name: "Default Configuration").singleValue,
//        InfoPlist.PlistProperty.delegateClassName.singleValue
//    ]).singleValue
//    
//    
//    static var configurations: SingleDictValue = PlistProperty.windowSceneSession(data: [windowSession]).singleValue
//    
//    static var manifest: SingleDictValue = PlistProperty.sceneManifest(data: [
//        PlistProperty.supportMultipleScenes(flag: false).singleValue,
//        configurations
//    ]).singleValue
//    
//    static var temp: InfoPlist = .extendingDefault(with:
//        PlistProperty.launchStoryboardName(name: "Resources/LaunchScreen").singleValue
//        .merging(value: manifest)
//       
//    )

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
