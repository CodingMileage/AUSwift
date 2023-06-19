//
//  ContentView.swift
//  Adventure
//
//  Created by Brandon LeBlanc on 6/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Image("fbg").resizable().edgesIgnoringSafeArea(.all)
                VStack{
                    Text("The Strange Knock").font(.largeTitle).multilineTextAlignment(.center).colorInvert()
                
                    Text("").font(.headline)
                    NavigationLink(destination: PageView(choiceMade: .constant(0))) {
                        Text("Lets Go")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
