//
//  TransformerTests.swift
//  DemoAppTests
//
//  Created by Ty Sang on 2018-01-28.
//  Copyright © 2018 Ty Sang. All rights reserved.
//

import XCTest
@testable import DemoApp

class TransformerTests: XCTestCase {

  var battleAnalyzer: BattleAnalyzer!
  override func setUp() {
    super.setUp()

    battleAnalyzer = BattleAnalyzer()
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()

    battleAnalyzer = nil
  }

  func testBattle1() {
    // Rule #1:
    // If any fighter is down 4 or more points of courage and 3 or more points of strength compared to their opponent, the opponent automatically wins the face-off regardless of overall rating (opponent has ran away)
    let transformer1 = Transformer(name: "Soundwave",
                                   team: .deception,
                                   strength: 8,
                                   intelligence: 9,
                                   speed: 2,
                                   endurance: 6,
                                   courage: 9,
                                   firepower: 5,
                                   rank: 6,
                                   skill: 10)

    let transformer2 = Transformer(name: "Bluestreak",
                                   team: .autobot,
                                   strength: 6,
                                   intelligence: 6,
                                   speed: 7,
                                   endurance: 9,
                                   courage: 5,
                                   firepower: 2,
                                   rank: 9,
                                   skill: 7)

    let transformer3 = Transformer(name: "Hubcap",
                                   team: .autobot,
                                   strength: 4,
                                   intelligence: 4,
                                   speed: 4,
                                   endurance: 4,
                                   courage: 4,
                                   firepower: 4,
                                   rank: 4,
                                   skill: 4)

    let result = battleAnalyzer.analyze(autobotTeam: [transformer2, transformer3], deceptionTeam: [transformer1])

    XCTAssertEqual(result.numBattles, 1)
    XCTAssertEqual(result.winningTeam, [transformer1])
    XCTAssertEqual(result.survivingMembers, [transformer3])
  }

  func testBattle2() {
    // Rule #2:
    // if   one of the fighters is 3 or more points of skill above their opponent, they win the fight regardless of overall rating
    let transformer1 = Transformer(name: "Soundwave",
                                   team: .deception,
                                   strength: 8,
                                   intelligence: 9,
                                   speed: 2,
                                   endurance: 6,
                                   courage: 7,
                                   firepower: 5,
                                   rank: 6,
                                   skill: 10)

    let transformer2 = Transformer(name: "Bluestreak",
                                   team: .autobot,
                                   strength: 6,
                                   intelligence: 6,
                                   speed: 7,
                                   endurance: 9,
                                   courage: 5,
                                   firepower: 2,
                                   rank: 9,
                                   skill: 7)

    let transformer3 = Transformer(name: "Hubcap",
                                   team: .autobot,
                                   strength: 4,
                                   intelligence: 4,
                                   speed: 4,
                                   endurance: 4,
                                   courage: 4,
                                   firepower: 4,
                                   rank: 4,
                                   skill: 4)

    let result = battleAnalyzer.analyze(autobotTeam: [transformer2, transformer3], deceptionTeam: [transformer1])

    XCTAssertEqual(result.numBattles, 1)
    XCTAssertEqual(result.winningTeam, [transformer1])
    XCTAssertEqual(result.survivingMembers, [transformer3])
  }


  func testBattle3() {
    // Rule #3:
    // In the event of a tie, both Transformers are considered destroyed
    let transformer1 = Transformer(name: "Soundwave",
                                   team: .deception,
                                   strength: 8,
                                   intelligence: 9,
                                   speed: 2,
                                   endurance: 6,
                                   courage: 7,
                                   firepower: 5,
                                   rank: 6,
                                   skill: 10)

    let transformer2 = Transformer(name: "Soundwave",
                                   team: .deception,
                                   strength: 8,
                                   intelligence: 9,
                                   speed: 2,
                                   endurance: 6,
                                   courage: 7,
                                   firepower: 5,
                                   rank: 6,
                                   skill: 10)

    let transformer3 = Transformer(name: "Hubcap",
                                   team: .autobot,
                                   strength: 4,
                                   intelligence: 4,
                                   speed: 4,
                                   endurance: 4,
                                   courage: 4,
                                   firepower: 4,
                                   rank: 4,
                                   skill: 4)

    let result = battleAnalyzer.analyze(autobotTeam: [transformer2, transformer3], deceptionTeam: [transformer1])

    XCTAssertEqual(result.numBattles, 1)
    XCTAssertEqual(result.winningTeam, [])
    XCTAssertEqual(result.survivingMembers, [])
  }

  func testBattle4() {
    // Rule #4:
    // Any Transformer named Optimus Prime or Predaking wins his fight automatically regardless of any other criteria
    let transformer1 = Transformer(name: "Predaking")

    let transformer2 = Transformer(name: "Soundwave",
                                   team: .deception,
                                   strength: 8,
                                   intelligence: 9,
                                   speed: 2,
                                   endurance: 6,
                                   courage: 7,
                                   firepower: 5,
                                   rank: 6,
                                   skill: 10)

    let transformer3 = Transformer(name: "Hubcap",
                                   team: .autobot,
                                   strength: 4,
                                   intelligence: 4,
                                   speed: 4,
                                   endurance: 4,
                                   courage: 4,
                                   firepower: 4,
                                   rank: 4,
                                   skill: 4)

    let result = battleAnalyzer.analyze(autobotTeam: [transformer2, transformer3], deceptionTeam: [transformer1])

    XCTAssertEqual(result.numBattles, 1)
    XCTAssertEqual(result.winningTeam, [transformer1])
    XCTAssertEqual(result.survivingMembers, [transformer3])
  }
}
