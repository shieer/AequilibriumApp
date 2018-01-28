//
//  Transformer.swift
//  DemoApp
//
//  Created by Ty Sang on 2018-01-28.
//  Copyright © 2018 Ty Sang. All rights reserved.
//

import Foundation

enum Team: String {
  case autobot = "Autobots"
  case deception = "Deceptions"
}

struct Transformer: Equatable {

  var name: String
  var team: Team

  var strength: Int
  var intelligence: Int
  var speed: Int
  var endurance: Int
  var courage: Int
  var firepower: Int

  var rank: Int
  var skill: Int

  init(
    name: String,
    team: Team,
    strength: Int,
    intelligence: Int,
    speed: Int,
    endurance: Int,
    courage: Int,
    firepower: Int,
    rank: Int,
    skill: Int) {

    self.name = name
    self.team = team
    self.strength = strength
    self.intelligence = intelligence
    self.speed = speed
    self.endurance = endurance
    self.courage = courage
    self.firepower = firepower
    self.rank = rank
    self.skill = skill
  }

  // Random
  init(name: String) {
    self.name = name

    let teamRandom = 2.random()
    if teamRandom == 1 {
      self.team = Team.autobot
    } else {
      self.team = Team.deception
    }

    self.strength = 10.random()
    self.intelligence = 10.random()
    self.speed = 10.random()
    self.endurance = 10.random()
    self.courage = 10.random()
    self.firepower = 10.random()
    self.rank = 10.random()
    self.skill = 10.random()
  }

  static func ==(lhs: Transformer, rhs: Transformer) -> Bool {
    return lhs.name == rhs.name &&
           lhs.team == rhs.team &&
           lhs.strength == rhs.strength &&
           lhs.intelligence == rhs.intelligence &&
           lhs.speed == rhs.speed &&
           lhs.endurance == rhs.endurance &&
           lhs.courage == rhs.courage &&
           lhs.firepower == rhs.firepower &&
           lhs.rank == rhs.rank &&
           lhs.skill == rhs.skill
  }
}

extension Transformer {
  func overall() -> Int {
    return strength + intelligence + speed + endurance + firepower
  }
  func isSuperTranformer() -> Bool {
    return name == "Optimus Prime" || name == "Predaking"
  }
}


