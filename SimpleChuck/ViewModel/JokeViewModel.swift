//
//  JokeViewModel.swift
//  SimpleChuck
//
//  Created by Peter Forward on 3/11/22.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class JokeViewModel: ObservableObject {
    
    var jokeManager = JokeManager()
    
    @Published var categories: [String] = []
    @Published var selectedCategory = ""
    @Published var showCategoryList = false
    @Published var jokes: [Joke] = []
    { didSet { self.didChange.send(self)}}
    
    var didChange = PassthroughSubject<JokeViewModel, Never>()
      
 
//    init() {
//        fetchCategories()
//    }
    
    
    func fetchCategories() async {
        Task {
            let fetchedCategories = jokeManager.fetchCategories
            

        
            categories = []
            categories.append(jokeManager.AllCategories)
            selectedCategory=jokeManager.AllCategories
            
            for (_, category) in try await fetchedCategories().enumerated() {
                
                categories.append(category)
            }
        }
    }
    
    public func toggleCategoryList() {
        withAnimation(.easeInOut) {
            showCategoryList.toggle() //= !showCategoryList
        }
    }
    
    public func selectCategory(category: String) {
        selectedCategory = category
    }
    
    func fetchNextJoke() {
        Task {
            let newJoke = try await jokeManager.fetchJoke(category: selectedCategory)
            withAnimation(.easeInOut) {
                jokes.insert(newJoke, at: 0)
                
            }
        }
    }
    
    func removeJokes(atOffsets: IndexSet) {
        atOffsets.sorted(by: > ).forEach { (i) in
            jokes.remove(at: i)
        }
    }
    

    
}
