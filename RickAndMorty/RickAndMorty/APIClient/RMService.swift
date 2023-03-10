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
    static let shard = RMService()
    
    private init() {}
    
    public func execute(_ request: RMRequest, completion:@escaping() -> Void) {
        
    }
}
