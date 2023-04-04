//
//  DetailInteractor.swift
//  NamesAndMeanings
//
//  Created by İbrahim Bayram on 4.04.2023.
//

import Foundation

//Talks to Presenter

protocol AnyDetailInteractor {
    var presenter : AnyDetailPresenter? {get set}
    
    func fetchDetails(slug : String)
}

class DetailInteractor : AnyDetailInteractor {
    var presenter: AnyDetailPresenter?
    
    func fetchDetails(slug: String) {
        NetworkManager.shared.request(url: .meaning, input: slug, type: NameData.self, method: .get) { response in
            self.presenter?.interactorDidFetchDetails(result: response)
        }
    }
    
}
