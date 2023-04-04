//
//  DetailRouter.swift
//  NamesAndMeanings
//
//  Created by İbrahim Bayram on 4.04.2023.
//

import Foundation
import UIKit

//Talks to presenter
typealias SecondView = AnyDetailView & UIViewController
protocol AnyDetailRouter {
    var secondView : SecondView? {get set}
    
    static func viewDidChanged() -> AnyDetailRouter
}

class DetailRouter : AnyDetailRouter {
    var secondView: SecondView?
    
    static func viewDidChanged() -> AnyDetailRouter {
        let router = DetailRouter()
        
        var view : AnyDetailView = DetailView()
        var interactor : AnyDetailInteractor = DetailInteractor()
        var presenter : AnyDetailPresenter = DetailPresenter()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        interactor.presenter = presenter
        
        router.secondView = view as? SecondView
        
        return router
    }
    
    
}
