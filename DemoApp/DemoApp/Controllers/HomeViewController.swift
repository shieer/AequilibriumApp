//
//  HomeViewController.swift
//  DemoApp
//
//  Created by Ty Sang on 2018-01-27.
//  Copyright © 2018 Ty Sang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.

    self.title = "HOME"
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  

  @IBAction func castleTapped(_ sender: UIButton) {

    let part1VC = self.storyboard?.instantiateViewController(withIdentifier: "Part1ViewController") as! Part1ViewController
    self.navigationController?.pushViewController(part1VC, animated: true)
  }

  @IBAction func transformerTapped(_ sender: UIButton) {

    let part2VC = self.storyboard?.instantiateViewController(withIdentifier: "Part2ViewController") as! Part2ViewController
    self.navigationController?.pushViewController(part2VC, animated: true)
  }


}
