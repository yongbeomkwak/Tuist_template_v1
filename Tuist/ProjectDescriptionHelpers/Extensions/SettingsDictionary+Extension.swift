import ProjectDescription

public let baseSetting: SettingsDictionary = SettingsDictionary()

extension SettingsDictionary {
    
    static func makeProjectSetting() -> SettingsDictionary {
        return baseSetting
    }
    
     func merging(category: Category) -> SettingsDictionary  {
         return self.merging(category.setting)
    }
    
    enum Category {
        case alternateAppIconNames(array: [String])
        
        var setting: SettingsDictionary {
            switch self {
            case let .alternateAppIconNames(array):
                return ["ASSETCATALOG_COMPILER_ALTERNATE_APPICON_NAMES": .array(array)]
            }
        }
    }
    
}


