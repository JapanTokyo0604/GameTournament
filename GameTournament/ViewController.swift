//
//  ViewController.swift
//  GameTournament
//
//  Created by I.T on 2020/09/20.
//  Copyright © 2020 I.T. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func tapSettingsButton(_ sender: Any) {
        guard let vc = Storyboard.settings.initialViewController else { return }
        self.present(vc, animated: true)
    }
    
}

