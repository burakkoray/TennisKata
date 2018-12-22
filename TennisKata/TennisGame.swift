//
//  TennisGame.swift
//  TennisKata
//
//  Created by Burak Koray Kose on 22.12.2018.
//  Copyright © 2018 Burak Koray Kose. All rights reserved.
//

import Foundation

class TennisGame{
    
    var player1 : TennisPlayer = TennisPlayer(name: "")
    var player2 : TennisPlayer = TennisPlayer(name: "")
    
    func player1Scores()  {
        scored(scoredPlayer: player1, opponentPlayer: player2)
    }
    
    func player2Scores()  {
        scored(scoredPlayer: player2, opponentPlayer: player1)
    }
}

extension TennisGame{
    
    func scored(scoredPlayer : TennisPlayer , opponentPlayer : TennisPlayer){
        switch (scoredPlayer.score, opponentPlayer.score) {
        case (.Thirty,.Forty):
            scoredPlayer.scored()
            writeToScoreboard(player1: scoredPlayer, player2: opponentPlayer, game: TennisGame.Game.Deuce)
            break
        case (.Forty,.Forty):
            scoredPlayer.scored()
            writeToScoreboard(player1: scoredPlayer, player2: opponentPlayer, game: TennisGame.Game.Advantage)
            break
        case (.Forty, .Love), (.Forty, .Fifteen), (.Forty, .Thirty):
            scoredPlayer.scored()
            writeToScoreboard(player1: scoredPlayer, player2: opponentPlayer, game: TennisGame.Game.Win)
            break
        case (.Advantage, .Forty):
            scoredPlayer.scored()
            writeToScoreboard(player1: scoredPlayer, player2: opponentPlayer, game: TennisGame.Game.Win)
            break
        case (.Forty, .Advantage):
            opponentPlayer.score = .Forty
            writeToScoreboard(player1: scoredPlayer, player2: opponentPlayer, game: TennisGame.Game.Deuce)
            break
        default:
            scoredPlayer.scored()
            writeToScoreboard(player1: scoredPlayer, player2: opponentPlayer, game: TennisGame.Game.Score)
        }
    }
    
    func writeToScoreboard(player1 : TennisPlayer , player2 : TennisPlayer , game: Game){
        switch game {
        case .Win:
            print("SCORED:\(player1.name) \n \(player1.name) Wins Game")
            writeCurrentScore(player1: player1, player2: player2)
            break
        case .Deuce:
            print("SCORED:\(player1.name) \n DEUCE ")
            writeCurrentScore(player1: player1, player2: player2)
            break
        case .Score:
            print("SCORED:\(player1.name) \n ")
            writeCurrentScore(player1: player1, player2: player2)
            break
        case .Advantage:
            print("SCORED: \(player1.name) \n takes the advantage ")
            writeCurrentScore(player1: player1, player2: player2)
            break
        }
    }
    
    func writeCurrentScore(player1 : TennisPlayer , player2 : TennisPlayer)  {
        print("\(player1.name) : \(player1.score) - \(player2.name) : \(player2.score)")
    }
    
    enum Game{
        case Win
        case Deuce
        case Advantage
        case Score
    }
    
}
