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
    
    let headers = ["Authorization": "Bearer 2viCCAlwvfui9gbuK2auPf8d6GdryI78dlkYNVQe5JwLaAoots1Z2VDSzld0"]
}
