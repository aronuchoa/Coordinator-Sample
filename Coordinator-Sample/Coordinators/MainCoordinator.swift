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
    let creditCardCoordinator: CreditCardCoordinator
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        bankStatementDetailCoordinator = BankStatementDetailCoordinator(navigationController: navigationController)
        creditCardCoordinator = CreditCardCoordinator(navigationController: navigationController)
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
    func openCreditCards() {
        creditCardCoordinator.start()
    }
    
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
