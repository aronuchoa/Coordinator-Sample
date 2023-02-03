//
//  CreditCardCoordinator.swift
//  Coordinator-Sample
//
//  Created by Aron Uchoa Bruno on 03/02/23.
//

import UIKit

class CreditCardCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var creditCardViewController: CreditCardViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let creditCardViewController = CreditCardViewController(nibName: nil, bundle: nil)
        navigationController.pushViewController(creditCardViewController, animated: true)
        self.creditCardViewController = creditCardViewController
    }
    
}
