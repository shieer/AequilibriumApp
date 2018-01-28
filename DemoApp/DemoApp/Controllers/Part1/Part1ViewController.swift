//
//  Part1ViewController.swift
//  DemoApp
//
//  Created by Ty Sang on 2018-01-27.
//  Copyright © 2018 Ty Sang. All rights reserved.
//

import UIKit

enum Maybe {
  case peak, valley, none
}

class Part1ViewController: UIViewController {

  let sizeMax: Int = 20
  let heightMax: Int = 5

  var peaks: [[Int]] = []
  var valleys: [[Int]] = []

  var castleAnalyzer: CastelAnalyer!


  @IBOutlet weak var castleTableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    castleAnalyzer = CastelAnalyer()

    self.title = "The Castle Company"
  }

  @IBAction func generateTapped(_ sender: UIButton) {

    let landSize: Int = Int(arc4random_uniform(UInt32(sizeMax)))+1

    var land: [Int] = []

    for index in 0..<landSize {
      land.append(Int(arc4random_uniform(UInt32(heightMax))))
    }

    let result = castleAnalyzer.landAnalyze(land: land)

    print(land)
    peaks = result.peaks
    valleys = result.valleys

    castleTableView.reloadData()
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func intArrayToString(array: [Int]) -> String {

    let result = array.map{ String($0) }
    let resultString = result.joined(separator: ",")
    return "(\(resultString))"
  }
}

extension Part1ViewController: UITableViewDelegate, UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    if section == 0 { return peaks.count }
    else { return valleys.count }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "CastleCell")!
    if indexPath.section == 0 {
      cell.textLabel?.text = intArrayToString(array: peaks[indexPath.row])
    } else {
      cell.textLabel?.text = intArrayToString(array: valleys[indexPath.row])
    }

    return cell
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 30.0
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

    let label = UILabel(frame: CGRect(x: 16, y: 0, width: 200, height: 30))

    if section == 0 {
      label.text = "Peaks"
    } else {
      label.text = "Valleys"
    }
    return label
  }
}
