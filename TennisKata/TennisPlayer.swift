//
//  TennisPlayer.swift
//  TennisKata
//
//  Created by Burak Koray Kose on 22.12.2018.
//  Copyright © 2018 Burak Koray Kose. All rights reserved.
//

import Foundation

class TennisPlayer {
    
    enum Score :Int{
        case Love
        case Fifteen
        case Thirty
        case Forty
        case Advantage
        case Win
        
        mutating func next(){
            self = Score(rawValue: rawValue + 1) ?? Score(rawValue: 0)!
        }
    }
    
    var score: Score = Score.Love
    var oppenentScore : Score = Score.Love
    let name : String
    
    init(name: String) {
        self.name = name
    }
    
    func scored()  {
        score.next()
    }

}
