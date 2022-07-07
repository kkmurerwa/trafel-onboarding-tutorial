//
//  LoadingViewController.swift
//  Trafel
//
//  Created by Kenneth Murerwa on 05/07/2022.
//

import Foundation
import UIKit

class LoadingViewController: UIViewController {
    
    private let isUserLoggedIn = true
    
    
    // MARK: - UIViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delay(durationInSeconds: 2.0, completion: self.checkLoginStatus)
    }
    
    
    // MARK: - Session loading Logic
    
    private func checkLoginStatus() {
        
        
        if isUserLoggedIn {
            
            // If user is logged in show main tab bar controller
            PresenterManager.shared.show(viewController: .mainTabBarController)
            
        } else {
         
            // If user not logged in show onboarding controller
            performSegue(withIdentifier: Constants.Segues.showOnBoardingScreen, sender: nil)
        }
        
        
        
    }
    
}
