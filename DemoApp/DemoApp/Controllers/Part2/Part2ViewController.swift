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

    parseString()
  }
  private func parseString() {

    let transformersArray = inputTextView.text.split(separator: "\n")

    autoBotTeam = []
    deceptionTeam = []

    for item in transformersArray {
      //    print(item)

      let name = item[item.startIndex..<item.index(of: ":")!]
      print(name)
      let attributesArray = item[item.index(item.index(of: ":")!, offsetBy: 1)..<item.endIndex].split(separator: ",")

      for attribute in attributesArray {
        print(attribute)
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
      } else {
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
      }
    }

    let result = battleAnalyzer.analyze(autobotTeam: autoBotTeam, deceptionTeam: deceptionTeam)


    outputTextView.text = """
    \(result.numBattles) battle
    """

    if result.winningTeam.count > 0 {
      outputTextView.text = outputTextView.text + "\nWinning team (\(result.winningTeam.first!.team.rawValue)): \(result.winningTeam.first!.name)"
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
