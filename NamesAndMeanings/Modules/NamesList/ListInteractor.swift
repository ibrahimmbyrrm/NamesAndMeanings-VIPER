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
    
    func fetchData(input : String, searchType : BaseURLS)
}

class ListInteractor : AnyInteractor {
    var presenter: AnyPresenter?
    
    func fetchData(input : String, searchType: BaseURLS) {
        NetworkManager.shared.request(url: searchType, input: input, type: NameData.self, method: .get) { response in
            self.presenter?.interactorDidDownloadData(result: response)
        }
    }
    
    
    
}


