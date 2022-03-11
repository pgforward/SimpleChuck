//
//  JokeManager.swift
//  SimpleChuck
//
//  Created by Peter Forward on 3/10/22.
//

import Foundation

class JokeManager {
    
    let JokeUrl = "https://api.chucknorris.io/jokes/random"
    let CategoriesUrl = "https://api.chucknorris.io/jokes/categories"
    let AllCategories = "*** ALL ***"
    
    // MARK: - Request Joke
    func fetchJoke(category: String) async throws -> Joke {
        
        let url: URL
        if category==AllCategories || category=="" {
            url = URL(string: JokeUrl)!
        }  else {
            url = URL(string: "\(JokeUrl)?category=\(category)")!
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching joke")
        }
        
        let decodedData = try JSONDecoder().decode(Joke.self, from: data)
        
        return decodedData
    }
    
    func fetchCategories() async throws -> Welcome {
        let url = URL(string: "\(CategoriesUrl)")!
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching joke categories")
        }
        
        let decodedData = try JSONDecoder().decode(Welcome.self, from: data)
        
        return decodedData
    }
    
}
