//
//  TennisKataTests.swift
//  TennisKataTests
//
//  Created by Burak Koray Kose on 22.12.2018.
//  Copyright © 2018 Burak Koray Kose. All rights reserved.
//

import XCTest
@testable import TennisKata

class TennisKataTests: XCTestCase {

    let tennisGame = TennisGame()
    
    override func setUp() {
        super.setUp()
        let tennisPlayer1 : TennisPlayer = TennisPlayer(name: "Kim Clijsters")
        let tennisPlayer2 : TennisPlayer = TennisPlayer(name: "Justine Henin-Hardenne")

        tennisGame.player1 = tennisPlayer1
        tennisGame.player2 = tennisPlayer2
    }

    func testDeuceGame(){
        
        tennisGame.player1Scores()
        tennisGame.player2Scores()
        tennisGame.player2Scores()
        tennisGame.player2Scores()
        tennisGame.player1Scores()
        tennisGame.player1Scores()

        XCTAssertEqual(tennisGame.player1.score, tennisGame.player2.score)
        
    }
    
    func testWinGame(){
        
        tennisGame.player1Scores()
        tennisGame.player2Scores()
        tennisGame.player2Scores()
        tennisGame.player2Scores()
        tennisGame.player1Scores()
        tennisGame.player1Scores()
        tennisGame.player1Scores()
        tennisGame.player1Scores()

        XCTAssertEqual(tennisGame.player1.score, TennisPlayer.Score.Win)
    
    }

    func testAdvantageGame(){
        
        tennisGame.player1Scores()
        tennisGame.player2Scores()
        tennisGame.player2Scores()
        tennisGame.player2Scores()
        tennisGame.player1Scores()
        tennisGame.player1Scores()
        tennisGame.player1Scores()

        XCTAssertEqual(tennisGame.player1.score, TennisPlayer.Score.Advantage)
        
        tennisGame.player2Scores()
        tennisGame.player2Scores()

        XCTAssertEqual(tennisGame.player2.score, TennisPlayer.Score.Advantage)

    }
    
    func testPlayer(){
        let tennisPlayer : TennisPlayer = TennisPlayer.init(name: "Novak")
        
        tennisPlayer.scored()
        tennisPlayer.scored()
        
        XCTAssertEqual(tennisPlayer.score, TennisPlayer.Score.Thirty)
    }

}
