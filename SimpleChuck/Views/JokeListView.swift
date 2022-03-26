//
//  JokeListView.swift
//  SimpleChuck
//
//  Created by Peter Forward on 3/12/22.
//

import SwiftUI

struct JokeListView: View {
    @EnvironmentObject private var jvm: JokeViewModel
    
    init() {
        //       UITableView.appearance().separatorStyle = .none
        //       UITableViewCell.appearance().backgroundColor = UIColor(Color.red)
        UITableView.appearance().backgroundColor = UIColor(Color.purple.opacity(0.5))
//            .background(Color.purple.opacity(0.5))
    }
    var body: some View {
        
        List {
            Section(header: Text("\(jvm.jokes.count) Jokes")) {
            ForEach(jvm.jokes.indices, id: \.self) { index in
                JokeDetailView(joke: jvm.jokes[index], index: index)
            }
            .onDelete(perform: delete)
            .listRowBackground(Color.purple.opacity(0.5))
           
            }
        }
        
    }
    func delete(at offsets: IndexSet) {
        jvm.removeJokes(atOffsets: offsets)
    }

}

struct JokeListView_Previews: PreviewProvider {
    static var previews: some View {
        JokeListView()
    }
}
