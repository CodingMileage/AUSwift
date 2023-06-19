//
//  PageView.swift
//  Adventure
//
//  Created by Brandon LeBlanc on 6/18/23.
//

import SwiftUI

struct PageView: View {
    @Binding var choiceMade: Int
    var body: some View {
        NavigationStack{
            
            let currentPage: Story = stories[choiceMade]
            
            ZStack{
                Image("bedroom")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Image(currentPage.storyImage)
                        .resizable()
                        .scaledToFit()
                    Text(currentPage.storyText)
                        .padding()
                        .background(.gray)
                    
                    if currentPage.endOfStory {
                        NavigationLink(destination: ContentView()) {
                            Text("Start over")
                        }
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.headline)
                    }
                    
                    else {
                        NavigationLink(destination: PageView(choiceMade: .constant(currentPage.c1Dest))) {
                            Text(currentPage.c1)
                        }
                        .padding()
                        .background(.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.headline)
                        
                        NavigationLink(destination: PageView(choiceMade: .constant(currentPage.c2Dest))) {
                            Text(currentPage.c2)
                        }
                        .padding()
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.headline)
                    }
                }
            }
        }
        
    }
    
    
    struct PageView_Previews: PreviewProvider {
        static var previews: some View {
            PageView(choiceMade: .constant(2))
        }
    }
}
