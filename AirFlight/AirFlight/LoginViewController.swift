//
//  LoginViewController.swift
//  AirFlight
//
//  Created by Ahmed Amin on 06/09/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private let spinner = UIActivityIndicatorView(style: .large)
    private let loginStatus: [String] = LoginStatus.allCases.map( { $0.rawValue })
    
    // MARK: - IBOutles
    
    @IBOutlet weak var cloud1: UIImageView!
    @IBOutlet weak var cloud2: UIImageView!
    @IBOutlet weak var cloud3: UIImageView!
    @IBOutlet weak var cloud4: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var buttonWidthConstraints: NSLayoutConstraint!
    @IBOutlet weak var topButtonConstraints: NSLayoutConstraint!
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupSpinnerView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showWelcomeWithAnimation()
        showFieldsWithAnimation()
        showLoginWithAnimation()
        showCloudWithAnimation(cloud: cloud1)
        showCloudWithAnimation(cloud: cloud2)
        showCloudWithAnimation(cloud: cloud3)
        showCloudWithAnimation(cloud: cloud4)
        
    }
    
    
    // MARK: - IBActions
    
    @IBAction func loginPressed(_ sender: Any) {
        view.endEditing(true)
        
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, animations: {
            
            self.loginButton.center.y += 60
            self.loginButton.bounds.size.width  += 60
            self.topButtonConstraints.constant += 60
            self.buttonWidthConstraints.constant += 60
            self.loginButton.backgroundColor = .orange.withAlphaComponent(0.9)
            self.spinner.center = CGPoint(x: 40.0,
                                          y: self.loginButton.frame.size.height / 2)
            self.spinner.alpha = 1.0
            
            
        }, completion: { _ in
            
            self.showMessage(index: 0)
            
        })
    }
}

// MARK: - Setup View

extension LoginViewController {
    
    private func setupView() {
        
        welcomeLabel.frame.size.width -= view.frame.size.width
        usernameTextField.center.x -= view.center.x
        passwordTextField.center.x -= view.center.x
        loginButton.center.y -= 30
        loginButton.alpha = 0.0
        cloud1.alpha = 0
        cloud2.alpha = 0
        cloud3.alpha = 0
        cloud4.alpha = 0
    }
    
    private func setupSpinnerView() {
        
        spinner.frame = CGRect(x: -20.0, y: 6.0, width: 20.0, height: 20.0)
        spinner.startAnimating()
        spinner.alpha = 0.0
        loginButton.addSubview(spinner)
    }
    
    private func showWelcomeWithAnimation() {
        
        UIView.animate(withDuration: 1.5, animations: {
            self.welcomeLabel.frame.size.width += self.view.frame.size.width
        })
    }
    
    private func showFieldsWithAnimation() {
        
        UIView.animate(withDuration: 1.5, animations: {
            self.usernameTextField.center.x += self.view.center.x
        })
        
        UIView.animate(withDuration: 1.5, animations: {
            self.passwordTextField.center.x += self.view.center.x
        })
    }
    
    private func showLoginWithAnimation() {
        
        UIView.animate(withDuration: 1.5, animations: {
            self.loginButton.center.y += 30
            self.loginButton.alpha = 1.0
        })
    }
    
    private func showCloudWithAnimation(cloud: UIImageView) {
        
        UIView.animate(withDuration: 1.5, delay: 0, animations: {
            cloud.alpha = 1.0
        })
    }
    
    private func showMessage(index: Int) {
        
        statusLabel.text = loginStatus[index]
        
        UIView.transition(with: bannerView, duration: 0.7, options: [.transitionCurlDown], animations: {
            
            self.bannerView.isHidden = false
            
        }, completion: { _ in
            
            self.removeMessage(index: index)
           
        })
    }
    
    private func removeMessage(index: Int) {
        
        UIView.animate(withDuration: 0.7, delay: 2.0, options: .curveEaseIn, animations: {
            
            self.bannerView.center.x += self.view.frame.size.width
            
        }, completion: { _ in
            
           let statusIndex = index + 1
            
            if statusIndex < self.loginStatus.count {
                
                self.bannerView.center.x -= self.view.frame.size.width
                self.bannerView.isHidden = true
                self.showMessage(index: statusIndex)
                
            } else {
                
                self.resetLoginButtonAnimation()
            }
        })
    }
    
    private func resetLoginButtonAnimation() {
        
        UIView.animate(withDuration: 1.0, delay: 0.0, animations: {
            
            self.bannerView.isHidden = true
            self.spinner.alpha = 0.0
            self.spinner.frame = CGRect(x: -20.0, y: 6.0, width: 20.0, height: 20.0)
            self.loginButton.center.y -= 60
            self.loginButton.bounds.size.width  -= 60
            self.topButtonConstraints.constant -= 60
            self.buttonWidthConstraints.constant -= 60
            self.loginButton.backgroundColor = .red
            
        }, completion: { _ in
            // navigate to flight screen
        })
    }
}

