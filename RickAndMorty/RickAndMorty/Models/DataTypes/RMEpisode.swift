//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Furkan Sarı on 10.03.2023.
//

import Foundation

struct Episode: Codable {
    let id: Int
    let name: String
    let airDate: String
    
    enum CodingKeys: String, CodingKey {
            case airDate = "air_date"
            case id,name
            
        }
}
