//
//  MainViewController.swift
//  Coordinator-Sample
//
//  Created by Aron Uchoa Bruno on 18/01/23.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        print("Main")
    }
    
    func configureTabBar() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
    }
}
