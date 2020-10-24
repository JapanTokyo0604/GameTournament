//
//  SettingsViewController.swift
//  GameTournament
//
//  Created by I.T on 2020/09/21.
//  Copyright © 2020 I.T. All rights reserved.
//

import UIKit
import TwitterKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var twitterApiStartButton: UIButton!
    @IBOutlet weak var twitterTestButton: UIButton!
    @IBOutlet weak var twitterTestButton2: UIButton!
    @IBOutlet weak var testAppWebViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigatinoBar()
        self.settingsButtons()
    }
    
    /// TwitterAPIのセットアップ
    private func setupTwitter() {

    }
    
    /// ナビゲーションバーのセットアップ
    private func setupNavigatinoBar() {
        AppNavigationBar.setupNavigatinoBar(viewController: self)
        AppNavigationBar.setupRightBarButtonItem(viewController: self,
                                                 itemType: .close,
                                                 action: #selector(self.tabCloseButton(sender:)))
        self.navigationItem.title = Strings.settings.get(for: "navigationTitle")
    }
    
    /// ナビゲーションバー右側ボタンをタップした時の処理
    @objc private func tabCloseButton(sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    /// ボタンのセットアップ
    private func settingsButtons() {
        twitterApiStartButton.setTitle(Strings.settings.get(for: "TwitterTest"), for: .normal)
    }
    
    @IBAction func tapTwitterApiStart(_ sender: Any) {
        // 1.ログインされているか？
          if TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers() {
            // 2.ツィート開始
          } else {
            // 3.認証開始
            TWTRTwitter.sharedInstance().logIn(with: self, completion: { (session, error) in
              if let sess = session {
                print("Signed in as \(sess.userName)")
                // 4.ツィート開始
              } else {
                // 5.認証失敗
                print("login error: \(error?.localizedDescription)")
              }
            })
          }
    }
    
    @IBAction func tapAppWebViewStart(_ sender: Any) {
        guard let vc = Storyboard.appWebView.initialViewController else { return }
        self.present(vc, animated: true)
    }
}
