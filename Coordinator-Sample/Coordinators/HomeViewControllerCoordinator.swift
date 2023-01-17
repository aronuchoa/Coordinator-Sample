//
//  ViewControllerCoordinator.swift
//  Coordinator-Sample
//
//  Created by Aron Uchoa Bruno on 06/01/23.
//

import UIKit

class HomeViewControllerCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private var homeViewController: HomeViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController(nibName: nil, bundle: nil)
        navigationController.pushViewController(homeViewController, animated: true)
        self.homeViewController = homeViewController
    }
    
}
