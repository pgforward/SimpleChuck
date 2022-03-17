//
//  JokeView.swift
//  SimpleChuck
//
//  Created by Peter Forward on 3/12/22.
//

import SwiftUI

struct JokeView: View {
    
    @EnvironmentObject private var jvm: JokeViewModel
    
    var body: some View {
        NavigationView {
            
            VStack {
                JokeHeaderView()
                    .environmentObject(jvm)
                if !jvm.showCategoryList {
                    JokeListView()
                        .environmentObject(jvm)
                }
                
            }
            .background(Color.purple.opacity(0.5))
            .navigationTitle("Chuck Norris Jokes")
            .task {
                await jvm.fetchCategories()
            }
        }
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
    }
}
