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
        
        Button(action: categoryListToggle) {
            HStack {
                Image(systemName: "arrow.down")
                    .rotationEffect(Angle(degrees: jvm.showCategoryList ? 180 : 0))
                Text(jvm.selectedCategory)
                    .animation(.none, value: jvm.selectedCategory)
            }
        }
        .buttonStyle(MyButtonStyle())
        
        if jvm.showCategoryList {
            CategoryListView()
        } else {
            Button("Get Next Joke", action: getNextJoke)
                .buttonStyle(MyButtonStyle())
        }
    }
    func categoryListToggle() {
        jvm.toggleCategoryList()
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

