//
//  UsuarioCoreDataWorker.swift
//  VIP_Architecture
//
//  Created by Marcos Felipe Souza on 30/05/20.
//  Copyright © 2020 Marcos. All rights reserved.
//

import Foundation

final class UsuarioCoreDataWorker: UsuarioCoreDataWorkerType {
    
    func save(usuario: UsuarioModel.UsuarioCoreData) {
        print("There is an usuario saved")
        print(usuario)
    }
}
