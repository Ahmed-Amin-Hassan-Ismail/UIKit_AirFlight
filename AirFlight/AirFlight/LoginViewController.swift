//
//  LoginViewController.swift
//  AirFlight
//
//  Created by Ahmed Amin on 06/09/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutles
    
    @IBOutlet weak var cloud1: UIImageView!
    @IBOutlet weak var cloud2: UIImageView!
    @IBOutlet weak var cloud3: UIImageView!
    @IBOutlet weak var cloud4: UIImageView!
    @IBOutlet weak var welcomLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showWelcomWithAnimation()
        
    }
    
    
    // MARK: - IBActions
    
    @IBAction func loginPressed(_ sender: Any) {
        
    }
}

// MARK: - Setup View

extension LoginViewController {
    
    private func setupView() {
        
        welcomLabel.frame.size.width -= view.frame.size.width
        
    }
    
    private func showWelcomWithAnimation() {
        
        UIView.animate(withDuration: 1.0, animations: {
            self.welcomLabel.frame.size.width += self.view.frame.size.width
            
        })
    }
}

