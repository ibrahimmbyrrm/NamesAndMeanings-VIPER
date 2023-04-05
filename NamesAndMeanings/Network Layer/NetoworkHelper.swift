//
//  NetoworkHelper.swift
//  NamesAndMeanings
//
//  Created by İbrahim Bayram on 4.04.2023.
//

import Foundation

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
}

enum BaseURLS : String {
    case meaning = "https://www.nosyapi.com/apiv2/names/getNameMeaning?name="
    case firstLetter = "https://www.nosyapi.com/apiv2/names/getNameList?firstletter="
}

enum HTTPError : String, Error {
    case invalidURL = "Invalid URL"
    case invalidData = "Invalid Data"
    case parsingError = "Parsing Error"
}

struct NetworkHelper {
    
    static let shared = NetworkHelper()
    
    let headers = ["Authorization"     :
                    "Bearer W79uqXoSBrPp2566ZvFFvOoIhVDnHuSkzIDOZ1jWIBQ3u8feQ5e7z4DGo3uK"]
    
}
