//
//  BankStatementViewControllerCoordinator.swift
//  Coordinator-Sample
//
//  Created by Aron Uchoa Bruno on 01/02/23.
//

import UIKit

class BankStatementDetailCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var bankStatementDetailViewController: BankStatementDetailViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let bankStatementDetailViewController = BankStatementDetailViewController(nibName: nil, bundle: nil)
        navigationController.pushViewController(bankStatementDetailViewController, animated: true)
        self.bankStatementDetailViewController = bankStatementDetailViewController
    }
    
}
