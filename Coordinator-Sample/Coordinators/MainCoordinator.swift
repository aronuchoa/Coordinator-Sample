//
//  ViewControllerCoordinator.swift
//  Coordinator-Sample
//
//  Created by Aron Uchoa Bruno on 06/01/23.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private var mainViewController: MainViewController?
    let bankStatementDetailCoordinator: BankStatementDetailCoordinator
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        bankStatementDetailCoordinator = BankStatementDetailCoordinator(navigationController: navigationController)
    }
    
    func start() {
        let mainViewController = MainViewController(nibName: nil, bundle: nil)
        mainViewController.mainViewControllerDelegate = self
        navigationController.pushViewController(mainViewController, animated: true)
        self.mainViewController = mainViewController
        self.mainViewController?.navigationItem.title = "Home"
        navigationController.navigationBar.prefersLargeTitles = true
    }
}

extension MainCoordinator: MainViewControllerDelegate {
    func openBankStatementDetail() {
        bankStatementDetailCoordinator.start()
    }
    
    func selectTabItem(selectedIndex: Int) {
        if selectedIndex == 0 {
            self.mainViewController?.navigationItem.title = "Home"
        }
        if selectedIndex == 1 {
            self.mainViewController?.navigationItem.title = "Bank Statement"
        }
    }
}
