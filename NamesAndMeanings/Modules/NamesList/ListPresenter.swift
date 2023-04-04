//
//  ListPresenter.swift
//  NamesAndMeanings
//
//  Created by İbrahim Bayram on 4.04.2023.
//

import Foundation

// Talks to View, Interactor, Router

protocol AnyPresenter {
    var view : AnyView? {get set}
    var interactor : AnyInteractor? {get set}
    var router : AnyRouter? {get set}
    
    func interactorDidDownloadData(result : Result<NameData,HTTPError>)
    
}

class ListPresenter : AnyPresenter {
    var view: AnyView?
    var interactor: AnyInteractor?
    var router: AnyRouter?
    
    func interactorDidDownloadData(result: Result<NameData, HTTPError>) {
        switch result {
        case .success(let nameList):
            view?.update(with: nameList.data)
        case .failure(let error):
            view?.update(with: error)
        }
    }
    
    
    
}
