//
//  AppCoordinator.swift
//  Coordinator-Sample
//
//  Created by Aron Uchoa Bruno on 06/01/23.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    let mainCoordinator: MainCoordinator
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        mainCoordinator = MainCoordinator(navigationController: navigationController)
    }
    
    func start() {
        window.rootViewController = self.navigationController
        mainCoordinator.start()
        window.makeKeyAndVisible()
    }
    
    
}
