//
//  MainViewController.swift
//  Coordinator-Sample
//
//  Created by Aron Uchoa Bruno on 18/01/23.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func selectTabItem(selectedIndex: Int)
    func openBankStatementDetail()
}

class MainViewController: UITabBarController {
    
    weak var mainViewControllerDelegate: MainViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        setupViewControllers()
        self.delegate = self
    }
    
    func configureTabBar() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
    }
    
    func setupViewControllers() {
        let homeImage = UIImage(systemName: "house")
        let homeController = HomeViewController()
        homeController.tabBarItem = UITabBarItem(title: "Home", image: homeImage, tag: 0)
        homeController.tabBarItem = UITabBarItem(title: "Home", image: homeImage, selectedImage: homeImage)
        homeController.navigationItem.title = "Home"
        
        let bankStatementImage = UIImage(systemName: "doc")
        let bankStatementController = BankStatementViewController()
        bankStatementController.tabBarItem = UITabBarItem(title: "Bank Statement", image: bankStatementImage, selectedImage: bankStatementImage)
        bankStatementController.navigationItem.title = "Bank Statement"
        bankStatementController.delegate = self
        
        self.viewControllers = [homeController, bankStatementController]
    }
}

extension MainViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let index = viewController.tabBarController?.selectedIndex else {
            return
        }
        mainViewControllerDelegate?.selectTabItem(selectedIndex: index)
    }
}

extension MainViewController: BankStatementViewControllerDelegate {
    func clickBankStatementDetail() {
        mainViewControllerDelegate?.openBankStatementDetail()
    }
}
