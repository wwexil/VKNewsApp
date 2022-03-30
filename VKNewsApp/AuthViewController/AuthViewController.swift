//
//  AuthViewController.swift
//  VKNewsApp
//
//  Created by Алекс Мерсер on 28.03.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        authService = SceneDelegate.shared().authService
        
        view.backgroundColor = .red 
    }

    @IBAction func signInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
}

