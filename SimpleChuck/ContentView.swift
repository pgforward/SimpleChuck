//
//  ContentView.swift
//  SimpleChuck
//
//  Created by Peter Forward on 3/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var jvm = JokeViewModel()
    
    var body: some View {
        VStack {
            JokeView()
                .environmentObject(jvm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
