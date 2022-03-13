//
//  JokesHeaderView.swift
//  SimpleChuck
//
//  Created by Peter Forward on 3/11/22.
//

import SwiftUI

struct JokeHeaderView: View {
    @EnvironmentObject private var jvm: JokeViewModel
    
    var body: some View {
        
        if jvm.categories.count < 1 {
            Button("Fetch Categories", action: getCategories)
                .font(.body)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green).shadow(radius: 2))
                .foregroundColor(Color.primary)
        }
        
        if jvm.categories.count > 0 {
            HStack {
                Text("Select a category")
                Picker("Categories", selection: $jvm.selectedCategory) {
                    ForEach(jvm.categories, id: \.self) {
                        Text($0)
                            .font(.body)
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green).shadow(radius: 2))
                            .foregroundColor(Color.primary)
                    }
                }
            }
            
        }
        
        Button("Get Next Joke", action: getNextJoke)
            .font(.body)
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green).shadow(radius: 2))
            .foregroundColor(Color.primary)
        
    }
    func getCategories() {
        jvm.fetchCategories()
    }
    
    func getNextJoke() {
        jvm.fetchNextJoke()
    }
}

struct JokesListView_Previews: PreviewProvider {
    static var previews: some View {
        JokeHeaderView()
    }
}
