//
//  ViewController.swift
//  Trafel
//
//  Created by Kenneth Murerwa on 05/07/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    private enum PageType {
        case login
        case signUp
    }
    
    private var errorMessage: String? {
        didSet {
            showErrorMessageIfNeeded(text: errorMessage)
        }
    }
    
    private var currentPageType: PageType = .login {
        didSet {
            setUpViewsFor(pageType: currentPageType)
        }
    }
    
    private var isSuccessfulLogin = false
    
    var delegate: OnboardingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViewsFor(pageType: .login)
    }
    
    
    // MARK: - Segment control logic
    
    @IBAction func segmentControlChanged(_ sender: UISegmentedControl) {
        
        // Update current page type
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signUp
    }
    
    private func setUpViewsFor(pageType: PageType) {
        
        errorLabel.text = ""
    
        confirmPasswordTextField.isHidden = pageType == .login
        signUpButton.isHidden = pageType == .login
        forgotPasswordButton.isHidden = pageType == .signUp
        loginButton.isHidden = pageType == .signUp
    }
    
    
    
    // MARK: - Button methods
    
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
        // TODO: Add forgot password maybe?
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        
        if isSuccessfulLogin {
            
        } else {
            
        }
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        if isSuccessfulLogin {
            
            // Go to main tab bar
            delegate?.showMainTabBarController()
        } else {
            
            // Show error message
            errorMessage = "Your password is invalid"
        }
        
    }
    
    private func showErrorMessageIfNeeded(text: String?) {
        errorLabel.isHidden = text == nil
        errorLabel.text = text
    }
    
    
}
