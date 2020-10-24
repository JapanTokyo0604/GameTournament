//
//  Resource.swift
//  GameTournament
//
//  Created by I.T on 2020/09/21.
//  Copyright © 2020 I.T. All rights reserved.
//

import UIKit

typealias TwitterKey = Resource.TwitterKey
typealias Strings = Resource.Strings
typealias Storyboard = Resource.Storyboard

struct Resource {
    
    /// TwitterのconsumerKey管理
    ///
    /// info.plistも変更する必要あり
    enum TwitterKey {
        static let consumerKey = ""
        static let secretKey = ""
    }
    
    /// Stringsファイル管理
    ///
    /// ex)  Strings.settings.get(for: "TwitterTest")
    enum Strings: String {
        case settings = "Settings"
        
        var tableName: String {
            rawValue
        }
        
        func get(for key: String) -> String {
            NSLocalizedString(key, tableName: tableName, value: "", comment: "")
        }
    }
    
    /// Storyboardファイル管理
    ///
    /// ex)  Storyboard.settings.initialViewController
    enum Storyboard: String {
        case settings = "Settings"
        case appWebView = "AppWebView"
    
        var name: String {
            rawValue
        }
    
        var storyboard: UIStoryboard {
            UIStoryboard(name: name, bundle: nil)
        }
        
        var initialViewController: UIViewController? {
            let vc = storyboard.instantiateInitialViewController()
            vc?.modalPresentationStyle = .fullScreen
            return vc
        }
    }
}
