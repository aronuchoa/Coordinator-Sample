//
//  ViewControllerCoordinator.swift
//  Coordinator-Sample
//
//  Created by Aron Uchoa Bruno on 06/01/23.
//

import UIKit

class MainViewControllerCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var tabNavigationController: UINavigationController
    private var mainViewController: MainViewController?
    var viewControllers: [UIViewController] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabNavigationController = navigationController
        self.setupViewControllers()
    }
    
    func start() {
        let mainViewController = MainViewController(nibName: nil, bundle: nil)
        mainViewController.setViewControllers(viewControllers, animated: true)
        navigationController.pushViewController(mainViewController, animated: true)
        self.mainViewController = mainViewController
    }
    
    func setupViewControllers() {
        let homeImage = UIImage(systemName: "house")
        let bankStatementImage = UIImage(systemName: "doc")
        viewControllers = [
            createNavigationControllers(for: HomeViewController(), title: "Home", image: homeImage ?? UIImage()),
            createNavigationControllers(for: BankStatementViewController(), title: "Bank Statement", image: bankStatementImage ?? UIImage())
        ]
    }
    
    func createNavigationControllers(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        tabNavigationController = UINavigationController(rootViewController: rootViewController)
        tabNavigationController.tabBarItem.title = title
        tabNavigationController.tabBarItem.image = image
        tabNavigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return tabNavigationController
    }
}
