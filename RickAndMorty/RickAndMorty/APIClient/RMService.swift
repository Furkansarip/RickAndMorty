//
//  RMService.swift
//  RickAndMorty
//
//  Created by Furkan Sarı on 10.03.2023.
//

import Foundation



/// Primary API service object to get Rick and Morty data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()
    
    private init() {}
    
    public func execute<T: Codable>(_ request: RMRequest, expecting type: T.Type, completion:@escaping(Result<T,Error>) -> Void) {
        
    }
}
