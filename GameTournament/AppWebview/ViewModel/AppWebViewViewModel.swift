//
//  AppWebViewViewModel.swift
//  GameTournament
//
//  Created by I.T on 2020/10/22.
//  Copyright © 2020 I.T. All rights reserved.
//

import Foundation

class AppWebViewViewModel {
    
    var urlRequest: URLRequest?  {
        guard let url = URL(string: "https://www.google.com/?hl=ja") else { return nil }
        return URLRequest(url: url)
    }
    
}
