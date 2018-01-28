//
//  BattleAnalyzer.swift
//  DemoApp
//
//  Created by Ty Sang on 2018-01-28.
//  Copyright © 2018 Ty Sang. All rights reserved.
//

import Foundation

class BattleAnalyzer {

  private var numBattles: Int!
  private var winningTeam: [Transformer]!
  private var survivingMembers: [Transformer]!

  private var autobotTeam: [Transformer]!
  private var deceptionTeam: [Transformer]!

  private var numAutobotWins: Int = 0
  private var numDeceptionWins: Int = 0

  func analyze(autobotTeam: [Transformer], deceptionTeam: [Transformer]) -> (
    numBattles: Int,
    winningTeam: [Transformer],
    survivingMembers: [Transformer]) {

      numBattles = 0
      winningTeam = []
      survivingMembers = []
      
      // sort by rank
      self.autobotTeam = autobotTeam.sorted { $0.rank > $1.rank }
      self.deceptionTeam = deceptionTeam.sorted { $0.rank > $1.rank }

      let mininalTeamSize = min(self.autobotTeam.count, self.deceptionTeam.count)

      var battleResults: [Team?] = []

      for index in 0..<mininalTeamSize {
        battleResults.append(battle(autobot: self.autobotTeam[index], deception: self.deceptionTeam[index]))
      }

      self.numBattles = battleResults.count

      self.numAutobotWins = battleResults.filter { $0 != nil && $0! == .autobot }.count
      self.numDeceptionWins = battleResults.filter { $0 != nil && $0! == .deception }.count

      if self.numDeceptionWins > self.numAutobotWins {

        winningTeam = self.deceptionTeam
        if self.autobotTeam.count > mininalTeamSize {
          survivingMembers = Array(self.autobotTeam[mininalTeamSize..<self.autobotTeam.endIndex])
        }


      } else if self.numDeceptionWins < self.numAutobotWins {

        winningTeam = self.autobotTeam
        if self.deceptionTeam.count > mininalTeamSize {
          survivingMembers = Array(self.deceptionTeam[mininalTeamSize-1..<self.deceptionTeam.endIndex])
        }

      } else {
        winningTeam = []
        survivingMembers = []
      }

      return (numBattles, winningTeam, survivingMembers)
  }

  private func battle(autobot: Transformer, deception: Transformer) -> Team? {

    // Special Rules
    if autobot.isSuperTranformer() && deception.isSuperTranformer() { return nil }
    if autobot.isSuperTranformer() && !deception.isSuperTranformer() { return Team.autobot }
    if !autobot.isSuperTranformer() && deception.isSuperTranformer() { return Team.deception }

    // Rule #1
    if abs(autobot.courage - deception.courage) >= 4 || abs(autobot.strength - deception.strength) >= 3 {
      if autobot.courage - deception.courage >= 4 { return Team.autobot }
      if autobot.courage - deception.courage <= -4 { return Team.deception }
      if autobot.strength - deception.strength >= 3 { return Team.autobot }
      if autobot.strength - deception.strength <= -3 { return Team.deception }

    } else if abs(autobot.skill - deception.skill) >= 3{
      if autobot.skill - deception.skill >= 3 { return Team.autobot }
      if autobot.skill - deception.skill <= -3 { return Team.deception }
    } else {

      if autobot.overall() > deception.overall() { return Team.autobot }
      if autobot.overall() < deception.overall() { return Team.deception }
      if autobot.overall() == deception.overall() { return nil }
    }

    return nil
  }
}




















