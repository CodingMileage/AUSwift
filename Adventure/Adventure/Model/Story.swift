//
//  Story.swift
//  Adventure
//
//  Created by Brandon LeBlanc on 6/18/23.
//

import Foundation

struct Story {
    let storyText: String
    let c1: String
    let c1Dest: Int
    
    let c2: String
    let c2Dest: Int
    let storyImage: String
    
    let endOfStory: Bool
}

let stories = [
    Story(storyText: "You find your self awaken from a dream with a dazed look on your face. You hear a knock on the door but its 2 AM.",
          c1: "Get up to check it out.", c1Dest: 1,
          c2: "Ignore it and remember that you have work at 7 AM.", c2Dest: 3,
          storyImage: "runescapeFace", endOfStory: false),
    //P1
    Story(storyText: "You look through the peephole and there is a random man outside. He seems to be hiding something.",
          c1: "Answer", c1Dest: 2,
          c2: "Hide", c2Dest: 3,
          storyImage: "person", endOfStory: false),
    
    //P2
    Story(storyText: "He asks you about your cars extended warranty. You made a good choice or did you?",
          c1: "", c1Dest: 0,
          c2: "", c2Dest: 0,
          storyImage: "warranty", endOfStory: true),
    
    //P3
    Story(storyText: "You should answered.",
          c1: "", c1Dest: 0,
          c2: "", c2Dest: 0,
          storyImage: "faceburst", endOfStory: true)
]

