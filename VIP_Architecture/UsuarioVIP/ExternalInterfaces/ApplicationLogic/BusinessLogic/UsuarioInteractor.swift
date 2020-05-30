//
//  UsuarioInteractor.swift
//  VIP_Architecture
//
//  Created by Marcos Felipe Souza on 03/11/2017.
//  Copyright © 2017 Marcos. All rights reserved.
//

import UIKit

//MARK: Protocols --

protocol UsuarioInteractorInput {
    func fetchItems(request: UsuarioModel.Fetch.Request)
}

protocol UsuarioInteractorOutput {
    func presentFetchResults(response: UsuarioModel.Fetch.Response)
    func presentFetchError(message: UsuarioFetchWorkerError)
}

class UsuarioInteractor {
    var output: UsuarioInteractorOutput!
    var fetchWorker: UsuarioFetchWorkerType!
    var coreDataWorker: UsuarioCoreDataWorkerType!
}


extension UsuarioInteractor: UsuarioInteractorInput {
        
    /// Regra de negocio , faz o fetch e salva no banco quando houver sucesso no fetch
    func fetchItems(request: UsuarioModel.Fetch.Request) {
        if request.itemId == 0 || request.count == nil || request.keyword == nil {
            return output.presentFetchResults(response: UsuarioModel.Fetch.Response(testObj: nil, isError: true, message: "Campos não podem esta vazios"))
        }
        
        fetchWorker.fetch(itemId: request.itemId,
                          keyword: request.keyword!) { result in
                            
            switch result {
            case .success(let model):
                
                let usuario = UsuarioModel.UsuarioCoreData(id: request.itemId,
                                                           username: request.keyword ?? "",
                                                           password: request.count ?? "")
                
                if !model.isError {
                   self.coreDataWorker.save(usuario: usuario)
                }
                self.output.presentFetchResults(response: model)
                
            case .failure(let error):
                self.output.presentFetchError(message: error)
            }
        }
    }
}
