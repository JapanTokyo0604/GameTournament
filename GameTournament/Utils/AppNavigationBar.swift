//
//  AppNavigationBar.swift
//  GameTournament
//
//  Created by I.T on 2020/10/24.
//  Copyright © 2020 I.T. All rights reserved.
//

import UIKit

struct AppNavigationBar {
    
    /// ナビゲーションバーの設定
    enum BarSettings {
        case normal
        
        var barTintColor: UIColor {
            switch self {
            default:
                return .white
            }
        }
        
        var tintColor: UIColor {
            switch self {
            default:
                return .black
            }
        }
        
        var titleTextAttributes: [NSAttributedString.Key: Any] {
            switch self {
            default:
                return [.foregroundColor: UIColor.black,
                        .font: UIFont.boldSystemFont(ofSize: 16)]
            }
        }
    }
    
    /// UIBarButtonItemを返却
    enum ItemSettings {
        case skip
        case close
        case open
        
        func getBarButtonItem(viewController: UIViewController,
                              action: Selector?) -> UIBarButtonItem {
            switch self {
            case .skip:
                return UIBarButtonItem(title: "スキップ",
                                       style: .plain,
                                       target: viewController,
                                       action: action)
            case .close:
                return UIBarButtonItem(title: "閉じる",
                                       style: .plain,
                                       target: viewController,
                                       action: action)
            default:
                return UIBarButtonItem(image: UIImage(systemName: "close"),
                                       style: .plain,
                                       target: viewController,
                                       action: action)
            }
        }
    }
    
    static func setupNavigatinoBar(viewController: UIViewController,
                                   settings: BarSettings = BarSettings.normal) {
        guard let navigationController = viewController.navigationController else { return }
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = settings.barTintColor
        navigationController.navigationBar.tintColor = settings.tintColor
        navigationController.navigationBar.titleTextAttributes = settings.titleTextAttributes
    }
    
    static func setupLeftBarButtonItem(viewController: UIViewController,
                                        itemType: ItemSettings,
                                        action: Selector?) {
        viewController.navigationItem.leftBarButtonItem = itemType.getBarButtonItem(viewController: viewController, action: action)
    }
    
    static func setupRightBarButtonItem(viewController: UIViewController,
                                        itemType: ItemSettings,
                                        action: Selector?) {
        viewController.navigationItem.rightBarButtonItem = itemType.getBarButtonItem(viewController: viewController, action: action)
    }
}
