//
//  DetailPresenter.swift
//  NamesAndMeanings
//
//  Created by İbrahim Bayram on 4.04.2023.
//

import Foundation

// Talks to View, Interactor, Router

protocol AnyDetailPresenter {
    var view : AnyDetailView? {get set}
    var interactor : AnyDetailInteractor? {get set}
    var router : AnyDetailRouter? {get set}
    
    func interactorDidFetchDetails(result : Result<NameData, HTTPError>)
    
    
}

class DetailPresenter : AnyDetailPresenter {
    var view: AnyDetailView?
    var interactor: AnyDetailInteractor?
    var router: AnyDetailRouter?
    
    func interactorDidFetchDetails(result: Result<NameData, HTTPError>) {
        switch result {
        case .success(let nameData):
            guard let name = nameData.data.first else {return}
            view?.updateUI(name: name)
        case .failure(let error):
            print(error.rawValue)
        }
    }
    

    
    
}
