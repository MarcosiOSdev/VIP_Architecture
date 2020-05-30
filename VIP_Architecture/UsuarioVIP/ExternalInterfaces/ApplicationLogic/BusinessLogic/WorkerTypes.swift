//
//  WorkerTypes.swift
//  VIP_Architecture
//
//  Created by Marcos Felipe Souza on 30/05/20.
//  Copyright © 2020 Marcos. All rights reserved.
//

import Foundation

protocol UsuarioCoreDataWorkerType {
    func save(usuario: UsuarioModel.UsuarioCoreData)
}

enum UsuarioFetchWorkerError: Error {
    case network
    case jsonData
}

typealias responseHandler = (_ response: Result<UsuarioModel.Fetch.Response, UsuarioFetchWorkerError>) -> ()
protocol UsuarioFetchWorkerType {
    func fetch(itemId: Int!, keyword:String!, completion handler: responseHandler)
}
