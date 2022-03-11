//
//  ContentView.swift
//  SimpleChuck
//
//  Created by Peter Forward on 3/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var categories: [String] = []
    @State private var selectedCategory = ""
    
    @State var jokeText = ""
    
    var jokeManager = JokeManager()
    
    @State var showAlert = false
    @State var alertTitle = ""
    @State var alertMessage = ""
    var alert: Alert {
        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Dismiss")))
    }
    
    var body: some View {
        
        VStack {
            
            if categories.count < 1 {
            Button("Fetch Categories", action: fetchCategories)
                .font(.body)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green).shadow(radius: 2))
                .foregroundColor(Color.primary)
            }
            
            if categories.count > 0 {
                Text("Please select a category")
            Picker("Categories", selection: $selectedCategory) {
                ForEach(categories, id: \.self) {
                    Text($0)
                }
            }
            }
            
            Button("Fetch new joke", action: getNextJoke)
                .font(.body)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green).shadow(radius: 2))
                .foregroundColor(Color.primary)
            
            if jokeText != "" {
                Text(jokeText)
                    .lineLimit(nil)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(18)
                    .padding()
            }
            
        }
        .alert(isPresented: $showAlert, content: { self.alert })
    }
    
    func fetchCategories() {
        Task {
            let fetchedCategories = try await jokeManager.fetchCategories
            
            categories = []
            categories.append(jokeManager.AllCategories)
            selectedCategory=jokeManager.AllCategories
            for (index, category) in try await fetchedCategories().enumerated() {
                print("\(index). \(category)")
                categories.append(category)
            }
            //for category in fetchedCategories() {
                
                //print("\(ship.value) is from \(ship.key)")
            }
            
           // categories = fetchedCategories
            categories.append("All")
            //print(fetchedCategories)
            print("Stop Here ")
        }
    
    
    func getNextJoke() {
        Task {
            let newJoke = try await jokeManager.fetchJoke(category: selectedCategory)
            self.jokeText = newJoke.value ?? "No joke"
            print("Joke=\(jokeText)")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
