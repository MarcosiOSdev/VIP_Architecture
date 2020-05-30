//
//  UsuarioPresenter.swift
//  VIP_Architecture
//
//  Created by Marcos Felipe Souza on 03/11/2017.
//  Copyright © 2017 Marcos. All rights reserved.
//

import UIKit

protocol UsuarioPresenterInput: AnyObject {
    func presentFetchResults(response: UsuarioModel.Fetch.Response)
}

protocol UsuarioPresenteOutput: AnyObject {
    func successFetchItems(viewModel: UsuarioModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: UsuarioModel.Fetch.ViewModel)
}


class UsuarioPresenter: UsuarioPresenterInput {
    var output: UsuarioPresenteOutput!
    
    func presentFetchResults(response: UsuarioModel.Fetch.Response) {
        if response.isError {
            
            let viewModel = UsuarioModel.Fetch.ViewModel(
                usuario: "X",
                senha: "X",
                message: response.message,
                isError: true)
            
            output.errorFetchingItems(viewModel: viewModel)
        } else {
            
            let viewModel = UsuarioModel.Fetch.ViewModel(
                usuario: "X",
                senha: "X",
                message: response.message,
                isError: false)
            output.successFetchItems(viewModel: viewModel)
        }
    }
}

extension UsuarioPresenter: UsuarioInteractorOutput {
    func presentFetchError(message: UsuarioFetchWorkerError) {
        
        let viewModel = UsuarioModel.Fetch.ViewModel(usuario: "x",
                                                     senha: "x",
                                                     message: "Error no servidor, tente novamente",
                                                     isError: true)
        
        output.errorFetchingItems(viewModel: viewModel)
    }
}
