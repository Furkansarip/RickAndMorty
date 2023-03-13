//
//  GetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Furkan Sarı on 13.03.2023.
//

import Foundation

struct GetAllCharactersResponse : Codable {
    let info: Info
    
    let results: [RMCharacter]
}

struct Info : Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}
