//
//  PresenterManager.swift
//  Trafel
//
//  Created by Kenneth Murerwa on 05/07/2022.
//

import Foundation
import UIKit

class PresenterManager {
    
    static let shared = PresenterManager()
    
    private init() {
        
    }
    
    enum ViewController {
        case mainTabBarController
        case onboardingViewController
    }
    
    func show(viewController: ViewController) {
        
        var selectedVCIdentifier: String
        
        switch viewController {
        case .mainTabBarController:
            selectedVCIdentifier = Constants.StoryboardIds.mainTabBarController
        case .onboardingViewController:
            selectedVCIdentifier = Constants.StoryboardIds.onboardingViewController
        }
        
        // Create onboardingViewController object
        let viewController = UIStoryboard(name: Constants.StoryboardIds.main, bundle: nil).instantiateViewController(withIdentifier: selectedVCIdentifier)
        
        
        // Safe check scene delegate before adding mainTabBar controller
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate, let window = sceneDelegate.window {
            
            // Change root view controller
            window.rootViewController = viewController
            
            // Add transition
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
            
        }
        
    }
    
}
