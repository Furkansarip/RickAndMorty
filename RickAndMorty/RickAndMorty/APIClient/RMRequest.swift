//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Furkan Sarı on 10.03.2023.
//

import Foundation

/// Object that represents a singlet API call
final class RMRequest {
    //Base URL
    //Endpoint
    //Path
    //Query Parameters
    
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    private let endpoint : RMEndpoint
    private let pathComponents : Set<String>
    private let queryParameters: [URLQueryItem]
    
    public var urlString: String {
        var string = "\(Constants.baseURL)/\(endpoint.rawValue)"
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            //name=value&name=value
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        return string
    }
    public var url:  URL? {
        return URL(string: urlString)
    }
    
    /// HTTP Methods
    public let httpMethod = "GET"
    
    init(endpoint: RMEndpoint, pathComponents: Set<String> = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
