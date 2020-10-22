//
//  AppWebViewViewController.swift
//  GameTournament
//
//  Created by I.T on 2020/10/22.
//  Copyright © 2020 I.T. All rights reserved.
//

import UIKit
import WebKit

class AppWebViewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var underTab: UIView!
    
    private var viewModel = AppWebViewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupWebView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadContents()
    }
    
    /// WebViewのセットアップ
    private func setupWebView() {
        self.webView.navigationDelegate = self
    }
    
    /// WebViewの読み込み処理
    private func loadContents() {
        guard let urlRequest = self.viewModel.urlRequest else { return }
        self.webView.load(urlRequest)
    }
    
}

extension AppWebViewViewController: WKNavigationDelegate {
    // TODO: URLによって判定する処理や通信失敗時など
}
