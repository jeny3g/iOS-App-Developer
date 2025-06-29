//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    
    var storyNumber = 0
    
    let stories = [
        Story(
            title: "You wake up in the Summoner's Rift. The jungle hums, and distant roars echo. A shadowy figure approaches—it's Zed. He offers you a chance to master the shadows.",
            choice1: "Accept Zed’s offer and embrace the shadows.", choice1Destination: 1,
            choice2: "Refuse and walk toward the light at the river.", choice2Destination: 2
        ),
        Story(
            title: "Zed teaches you the art of stealth and assassination. Your first mission: eliminate a Demacian scout near Baron pit.",
            choice1: "Execute the mission with precision.", choice1Destination: 3,
            choice2: "Spare the scout and report back.", choice2Destination: 4
        ),
        Story(
            title: "The light leads you to Lux, who senses potential in you. She invites you to train in the arcane arts at the Mageseekers’ tower.",
            choice1: "Train under Lux’s guidance.", choice1Destination: 5,
            choice2: "Sneak away and explore Piltover instead.", choice2Destination: 6
        ),
        Story(
            title: "You dispatch the scout with lethal efficiency. Zed praises your skill. You're now a shadow among shadows.",
            choice1: "The", choice1Destination: 0,
            choice2: "End", choice2Destination: 0
        ),
        Story(
            title: "Zed senses your hesitation. Disappointed, he vanishes into the fog. Moments later, a trap explodes—you're caught by a Demacian patrol.",
            choice1: "The", choice1Destination: 0,
            choice2: "End", choice2Destination: 0
        ),
        Story(
            title: "Lux teaches you to harness light. You become a radiant protector, standing against the darkness brewing in Runeterra.",
            choice1: "The", choice1Destination: 0,
            choice2: "End", choice2Destination: 0
        ),
        Story(
            title: "You wander Piltover's bustling streets. A hooded girl bumps into you—it's Jinx. She grins wildly and hands you a bomb.",
            choice1: "Run with Jinx and cause chaos.", choice1Destination: 7,
            choice2: "Turn her in to the Enforcers.", choice2Destination: 8
        ),
        Story(
            title: "Explosions echo behind you as you flee with Jinx. The city burns. She calls you her new favorite accomplice.",
            choice1: "The", choice1Destination: 0,
            choice2: "End", choice2Destination: 0
        ),
        Story(
            title: "You alert Caitlyn. She arrests Jinx after a heated chase. You're hailed as a hero of Piltover.",
            choice1: "The", choice1Destination: 0,
            choice2: "End", choice2Destination: 0
        )
    ]
    
    func getStory() -> Story {
        return stories[storyNumber]
    }
    
    mutating func nextStory(_ userChoice: String) {
        if userChoice == getStory().choice1 {
            storyNumber = getStory().choice1Destination
        } else {
            storyNumber = getStory().choice2Destination
        }
    }
    
}
