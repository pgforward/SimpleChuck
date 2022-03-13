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
            
            ForEach(jvm.jokes.indices, id: \.self) { index in
                Text(jvm.jokes[index].value ?? "No Joke")
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.yellow.opacity(index==0 ? 1.0 : 0.5)).shadow(radius: 2))
                    .foregroundColor(Color.primary)
            }.listRowBackground(Color.purple.opacity(0.5))
            
        }
        
    }
}

struct JokeListView_Previews: PreviewProvider {
    static var previews: some View {
        JokeListView()
    }
}
