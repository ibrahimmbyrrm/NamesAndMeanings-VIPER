//
//  ListInteractor.swift
//  NamesAndMeanings
//
//  Created by İbrahim Bayram on 4.04.2023.
//

import Foundation
 // Talks to presenter
protocol AnyInteractor {
    var presenter : AnyPresenter? {get set}
    
    func fetchLetter(letter : String, searchType : BaseURLS)
}

class ListInteractor : AnyInteractor {
    var presenter: AnyPresenter?
    
    func fetchLetter(letter : String, searchType: BaseURLS) {
        NetworkManager.shared.request(url: searchType, input: letter, type: NameData.self, method: .get) { response in
            self.presenter?.interactorDidDownloadData(result: response)
        }
    }
    
    
    
}


