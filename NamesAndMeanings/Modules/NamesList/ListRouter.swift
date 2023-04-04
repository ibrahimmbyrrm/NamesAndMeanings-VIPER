//
//  ListRouter.swift
//  NamesAndMeanings
//
//  Created by İbrahim Bayram on 4.04.2023.
//

import Foundation
import UIKit
//Talks to Presenter

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry : EntryPoint? {get}
    
    static func startExecution() -> AnyRouter
}

class ListRouter : AnyRouter {
    var entry: EntryPoint?
    
    
    
    static func startExecution() -> AnyRouter {
        let router = ListRouter()
        
        var view : AnyView = ListView()
        var presenter : AnyPresenter = ListPresenter()
        var interactor : AnyInteractor = ListInteractor()
        
        view.presenter = presenter
       
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        return router
    }
}
