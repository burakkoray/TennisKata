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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPlayer(){
        
        let tennisPlayer : TennisPlayer = TennisPlayer.init(name: "Novak")
        
        tennisPlayer.scored()
        tennisPlayer.scored()
        
        XCTAssertEqual(tennisPlayer.score, TennisPlayer.Score.Thirty)
        
    }

}
