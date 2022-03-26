//
//  JokeDetailView.swift
//  SimpleChuck
//
//  Created by Peter Forward on 3/26/22.
//

import SwiftUI

struct JokeDetailView: View {
    
    @EnvironmentObject private var jvm: JokeViewModel
    var joke: Joke
    var index: Int
    
    var body: some View {
        
        Button(action: {jvm.textToSpeech(inputString: joke.value ?? "No Joke")}, label: {
            Text("Read Joke")
                .font(.headline)
                .tint(.blue)
        })
        
        Text(joke.value ?? "No Joke")
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.yellow.opacity(index==0 ? 1.0 : 0.5)).shadow(radius: 2))
            .foregroundColor(Color.primary)
    }
}

struct JokeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        JokeDetailView(joke: Joke.empty, index: 0)
    }
}
