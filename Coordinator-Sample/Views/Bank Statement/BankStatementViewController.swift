//
//  BankStatementViewController.swift
//  Coordinator-Sample
//
//  Created by Aron Uchoa Bruno on 18/01/23.
//

import UIKit

protocol BankStatementViewControllerDelegate: AnyObject {
    func clickBankStatementDetail()
}

class BankStatementViewController: UIViewController {
    
    weak var delegate: BankStatementViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        let button:UIButton = UIButton()
        button.backgroundColor = .black
        button.setTitle("Open Bank Statement Detail", for: .normal)
        button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        
        //Add button inside the view before to set constraints
        self.view.addSubview(button)
        
        //Constraints
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: - Actions
    
    @objc func buttonClicked() {
        delegate?.clickBankStatementDetail()
    }
}
