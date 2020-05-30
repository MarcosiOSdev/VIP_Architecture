//
//  UsuarioWorker.swift
//  VIP_Architecture
//
//  Created by Marcos Felipe Souza on 03/11/2017.
//  Copyright © 2017 Marcos. All rights reserved.
//

import UIKit

class UsuarioWorker: UsuarioFetchWorkerType {
    func fetch(itemId: Int!, keyword: String!, completion handler: (Result<UsuarioModel.Fetch.Response, UsuarioFetchWorkerError>) -> ()) {
        
        if keyword == nil || keyword.isEmpty {
            handler(.failure(UsuarioFetchWorkerError.network))
        }
        
        if keyword == "123" {
            handler(.success(UsuarioModel.Fetch.Response(testObj: nil, isError: false, message: "Deu Certo")))
        } else {
            handler(.success(UsuarioModel.Fetch.Response(testObj: nil, isError: true, message: "Deu Errado")))
        }
    }
    
}
