//
//  CategoryListView.swift
//  SimpleChuck
//
//  Created by Peter Forward on 3/16/22.
//

import SwiftUI

struct CategoryListView: View {
    
    @EnvironmentObject private var jvm: JokeViewModel
    
    var body: some View {
        List {
            
            ForEach(jvm.categories, id: \.self) {category in
                
                Button {
                    jvm.selectCategory(category: category)
                    jvm.toggleCategoryList()
                } label: {
                    Text(category)
                    
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
                
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
