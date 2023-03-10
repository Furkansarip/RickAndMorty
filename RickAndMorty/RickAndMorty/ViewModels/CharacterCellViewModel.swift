//
//  CharacterCellViewModel.swift
//  RickAndMorty
//
//  Created by Furkan Sarı on 13.03.2023.
//

import Foundation

final class CharacterCellViewModel {
public let characterName:String
private let characterStatus:RMCharacterStatus
private let characterImageURL:URL?
    
    init(characterName:String, characterStatus:RMCharacterStatus, characterImageURL:URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageURL = characterImageURL
    }
    
    public var characterStatusText: String {
        return characterStatus.rawValue
    }
    
    public func fetchImage(completion:@escaping (Result<Data,Error>) -> Void) {
        guard let url = characterImageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
