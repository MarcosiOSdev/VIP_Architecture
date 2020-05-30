//
//  ViewController.swift
//  VIP_Architecture
//
//  Created by Marcos Felipe Souza on 03/11/2017.
//  Copyright © 2017 Marcos. All rights reserved.
//

import UIKit

class UsuarioViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    var input: UsuarioInteractorInput!
    var router: UsuarioRouter!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UsuarioConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorMessageLabel.isHidden = true
    }

    @IBAction func didTouchOnEntrarButton(_ sender: UIButton) {
        
        guard let keyword = self.usernameTextField.text,
            let count = self.passwordTextField.text else {
                return
        }        
        input.fetchItems(request: UsuarioModel.Fetch.Request(itemId: 23, keyword: keyword, count: count))
        
    }
}

extension UsuarioViewController: UsuarioPresenteOutput {
    func errorFetchingItems(viewModel: UsuarioModel.Fetch.ViewModel){
        self.errorMessageLabel.text = viewModel.message
        self.errorMessageLabel.isHidden = false
    }
    
    func successFetchItems(viewModel: UsuarioModel.Fetch.ViewModel) {
        self.errorMessageLabel.isHidden = true
        self.router.showSomeVC(with: viewModel)
    }
}

