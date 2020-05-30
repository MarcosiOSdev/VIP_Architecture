//
//  UsuarioModel.swift
//  VIP_Architecture
//
//  Created by Marcos Felipe Souza on 03/11/2017.
//  Copyright © 2017 Marcos. All rights reserved.
//

import UIKit

struct UsuarioModel {
    
    struct Fetch {
        struct Request {
            var itemId = 0
            var keyword: String?
            var count: String?
        }
        
        struct Response {
            var testObj: UsuarioModel?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel {
            var usuario: String?
            var senha: String?
            var message: String?
            var isError: Bool
        }
    }
    
    struct UsuarioCoreData: Codable {
        var id: Int
        var username: String
        var password: String
    }
}
