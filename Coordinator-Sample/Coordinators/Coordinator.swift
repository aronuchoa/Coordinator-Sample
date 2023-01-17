//
//  Coordinator.swift
//  Coordinator-Sample
//
//  Created by Aron Uchoa Bruno on 06/01/23.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
