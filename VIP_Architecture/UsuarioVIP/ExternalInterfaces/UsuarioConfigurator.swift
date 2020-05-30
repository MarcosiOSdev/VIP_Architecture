//
//  UsuarioConfigurator.swift
//  VIP_Architecture
//
//  Created by Marcos Felipe Souza on 03/11/2017.
//  Copyright © 2017 Marcos. All rights reserved.
//

import UIKit

class UsuarioConfigurator  {

    static let sharedInstance = UsuarioConfigurator()
    
    private init(){}
        
    var interactor: UsuarioInteractor = {
        let interactor = UsuarioInteractor()
        interactor.fetchWorker = UsuarioWorker()
        interactor.coreDataWorker = UsuarioCoreDataWorker()
        return interactor
    }()
    
    
    func configure(viewController: UsuarioViewController){
        
        let router = UsuarioRouter()
        router.viewController = viewController
        
        let presenter = UsuarioPresenter()
        presenter.output = viewController
        
        let interactor = self.interactor
        interactor.output = presenter
        
        
        viewController.input = interactor
        viewController.router = router
        
    }
}
