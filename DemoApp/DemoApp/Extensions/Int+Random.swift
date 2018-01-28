//
//  Int+Random.swift
//  DemoApp
//
//  Created by Ty Sang on 2018-01-28.
//  Copyright © 2018 Ty Sang. All rights reserved.
//

import Foundation

extension Int {
  func random() -> Int {
    return Int(arc4random_uniform(UInt32(self))) + 1
  }
}
