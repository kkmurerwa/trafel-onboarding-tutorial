//
//  SettingsViewController.swift
//  Trafel
//
//  Created by Kenneth Murerwa on 05/07/2022.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        
        PresenterManager.shared.show(viewController: .onboardingViewController)
        
    }
    
}
