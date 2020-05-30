//
//  UsuarioRouter.swift
//  VIP_Architecture
//
//  Created by Marcos Felipe Souza on 03/11/2017.
//  Copyright © 2017 Marcos. All rights reserved.
//

import UIKit

protocol UsuarioRouterInput {
    func showSomeVC(with viewModel: UsuarioModel.Fetch.ViewModel)
}

class UsuarioRouter {
    weak var viewController: UsuarioViewController!
    func passDataToNextScene(segue: UIStoryboardSegue){
        if segue.identifier == "someOtherVC"{
            
        }
    }
}

extension UsuarioRouter: UsuarioRouterInput {
    func showSomeVC(with viewModel: UsuarioModel.Fetch.ViewModel) {
        viewController.performSegue(withIdentifier: "someVC", sender: nil)
    }
}
