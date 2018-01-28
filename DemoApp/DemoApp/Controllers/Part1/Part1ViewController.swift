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

  var castleAnalyzer: CastleAnalyzer!


  @IBOutlet weak var castleTableView: UITableView!
  @IBOutlet weak var landTextField: UITextField!
  @IBOutlet weak var totalCastlesLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    castleAnalyzer = CastleAnalyzer()
    self.title = "The Castle Company"
  }

  @IBAction func generateTapped(_ sender: UIButton) {

    let landSize: Int = sizeMax.random()
    var land: [Int] = []

    for _ in 0..<landSize {
      land.append(heightMax.random())
    }

    let result = castleAnalyzer.landAnalyze(land: land)

    landTextField.text = intArrayToString(array: land)
    peaks = result.peaks
    valleys = result.valleys
    totalCastlesLabel.text = "Total castles: \(result.numCastles)"
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
    cell.textLabel?.textColor = UIColor.white

    return cell
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 30.0
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

    let headerView = UIView()
    let label = UILabel(frame: CGRect(x: 16, y: 0, width: 200, height: 30))

    if section == 0 {
      label.text = "\(peaks.count) Peak(s)"
    } else {
      label.text = "\(valleys.count) Valley(s)"
    }

    headerView.addSubview(label)
    headerView.backgroundColor = UIColor.white

    return headerView
  }
}
