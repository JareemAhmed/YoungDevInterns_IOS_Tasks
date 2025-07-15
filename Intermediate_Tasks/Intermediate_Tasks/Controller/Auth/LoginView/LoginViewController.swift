//
//  LoginViewController.swift
//  Intermediate_Tasks
//
//  Created by Apple on 7/15/25.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, LoginViewModelDelegate {

    @IBOutlet weak var emailTxtField: AppCustomTextField!
    @IBOutlet weak var passwordTxtField: AppCustomTextField!
    var loginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextFields()
        loginViewModel.delegate = self
        setNavigationBar()
    }
    func setTextFields(){
        loginViewModel.emailTextField = emailTxtField
        loginViewModel.passwordTextField = passwordTxtField
        self.passwordTxtField.isSecureTextEntry = true
        self.passwordTxtField.keyboardType = .alphabet
    }
    func variableDidChange(newValue: Bool) {
        if newValue {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
                navigationController?.pushViewController(vc, animated: true)
              } else {
                  print("Variable is false")
              }
    }
    func setNavigationBar() {
        
        self.navigationController?.isNavigationBarHidden = false
        HelperComponent.getInstance.setNavigationBar(leftBarItem: self.backBarButton(),title: "", isTransparent: true, vc: self)
    }
    @IBAction func SignInAction(_ sender: Any) {
        loginViewModel.performApi()
    }
}
