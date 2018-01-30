//
//  Part2ViewController.swift
//  DemoApp
//
//  Created by Ty Sang on 2018-01-27.
//  Copyright © 2018 Ty Sang. All rights reserved.
//

import UIKit

class Part2ViewController: UIViewController {

  var autoBotTeam: [Transformer] = []
  var deceptionTeam: [Transformer] = []

  var battleAnalyzer: BattleAnalyzer!

  @IBOutlet weak var inputTextView: UITextView!
  @IBOutlet weak var outputTextView: UITextView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.

    self.title = "The Transformation Company"

    battleAnalyzer = BattleAnalyzer()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func battleTapped(_ sender: UIButton) {

    do {
      try parseString()
    } catch ParseError.specNotMatch {
      outputTextView.text = "Sepcs have to be exactly 8"
    } catch ParseError.formatNotMatch {
      outputTextView.text = "Each transformer has to match format: String:(D/A),(1-10),(1-10),(1-10),(1-10),(1-10),(1-10),(1-10),(1-10)"
    } catch ParseError.teamNotMatch {
      outputTextView.text = "Team should be either D or A"
    } catch ParseError.criteriaTypeErro {
      outputTextView.text = "Each Criteria should between 1 and 10"
    } catch ParseError.criteriaRangeError {
      outputTextView.text = "Each Criteria should between 1 and 10"
    } catch {
      outputTextView.text = "Unknown Error"
    }
  }
  
  private func parseString() throws {

    let transformersArray = inputTextView.text.split(separator: "\n")

    autoBotTeam = []
    deceptionTeam = []

    for item in transformersArray {
      //    print(item)

      let name = item[item.startIndex..<item.index(of: ":")!]
      let attributesArray = item[item.index(item.index(of: ":")!, offsetBy: 1)..<item.endIndex].split(separator: ",")

      if attributesArray.count != 9 {
        throw ParseError.formatNotMatch
      }

      for index in 1..<9 {

        if Int(attributesArray[index]) == nil {
          throw ParseError.criteriaTypeErro
        }

        if Int(attributesArray[index])! >= 10 || Int(attributesArray[index])! < 1 {
          throw ParseError.criteriaRangeError
        }
      }

      if attributesArray[0] == "D" {
        let transformer = Transformer(name: String(name),
                                      team: .deception,
                                      strength: Int(attributesArray[1])!,
                                      intelligence: Int(attributesArray[2])!,
                                      speed: Int(attributesArray[3])!,
                                      endurance: Int(attributesArray[4])!,
                                      courage: Int(attributesArray[5])!,
                                      firepower: Int(attributesArray[6])!,
                                      rank: Int(attributesArray[7])!,
                                      skill: Int(attributesArray[8])!)
        deceptionTeam.append(transformer)
      } else if attributesArray[0] == "A" {
        let transformer = Transformer(name: String(name),
                                      team: .autobot,
                                      strength: Int(attributesArray[1])!,
                                      intelligence: Int(attributesArray[2])!,
                                      speed: Int(attributesArray[3])!,
                                      endurance: Int(attributesArray[4])!,
                                      courage: Int(attributesArray[5])!,
                                      firepower: Int(attributesArray[6])!,
                                      rank: Int(attributesArray[7])!,
                                      skill: Int(attributesArray[8])!)
        autoBotTeam.append(transformer)
      } else {
        throw ParseError.teamNotMatch
      }
    }

    // Generate the output string
    let result = battleAnalyzer.analyze(autobotTeam: autoBotTeam, deceptionTeam: deceptionTeam)
    outputTextView.text = """
    \(result.numBattles) battle
    """

    if result.winningTeam.count > 0 {
      outputTextView.text = outputTextView.text + "\nWinning team (\(result.winningTeam.first!.team.rawValue)): "

      var winningTeamNames: [String] = []
      for transformer in result.winningTeam {
        winningTeamNames.append(transformer.name)
      }
      let allWinningMembers = winningTeamNames.joined(separator: ", ")
      outputTextView.text = outputTextView.text + allWinningMembers

    } else {
      outputTextView.text = outputTextView.text + "\nWinning team : None"
    }

    if result.survivingMembers.count > 0 {

      outputTextView.text = outputTextView.text + "\nSurvivors from the losing team(\(result.survivingMembers.first!.team.rawValue)):"
      for survivor in result.survivingMembers {
        outputTextView.text = outputTextView.text + "\(survivor.name)"
      }
    }
  }
}
