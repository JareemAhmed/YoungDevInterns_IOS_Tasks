//
//  SplashViewController.swift
//  Intermediate_Tasks
//
//  Created by Apple on 7/15/25.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func loginAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
