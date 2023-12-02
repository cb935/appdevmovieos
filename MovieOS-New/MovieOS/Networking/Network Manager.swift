//
//  NetworkManager.swift
//  Hackathon
//
//  Created by Cole and Jamayne on 11/25/23.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}

    
    func fetchMovies(completion: @escaping ([Movie]) -> Void) {
        // Specify the endpoint
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase // Only if needed
        
        let endpoint = "https://api.jsonbin.io/v3/b/64d033f18e4aa6225ecbcf9f?meta=false"

        // Create the request
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [Movie].self, decoder: decoder) { response in
                // Handle the response
                switch response.result {
                case .success(let movies):
                    print("Successfully fetched \(movies.count) members")
                    completion(movies)
                case .failure(let error):
                    print("Error in NetworkManager.fetchPosts: \(error.localizedDescription)")
                }
            }
    }
    
}
