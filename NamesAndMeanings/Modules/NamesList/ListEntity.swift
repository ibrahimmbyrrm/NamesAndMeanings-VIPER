//
//  ListEntity.swift
//  NamesAndMeanings
//
//  Created by İbrahim Bayram on 4.04.2023.
//

import Foundation

struct NameData : Codable {
    let data : [Attributes]
}

struct Attributes : Codable {
    let name : String
    let slug : String
    let meaning : String?
    let gender : String?
    let origin : String?
    let kuran : Bool?
}


