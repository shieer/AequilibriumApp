//
//  CastleAnalyzer.swift
//  DemoApp
//
//  Created by Ty Sang on 2018-01-27.
//  Copyright © 2018 Ty Sang. All rights reserved.
//

import Foundation

class CastelAnalyer {

  func landAnalyze(land: [Int]) -> (peaks: [[Int]], valleys: [[Int]], numCastles: Int) {
    var peaks: [[Int]] = []
    var valleys: [[Int]] = []
    var numCastles: Int = 0
    var castle: [Int] = []
    var maybe: Maybe = .none

    for index in 0..<land.count-1 {
      if index == 0 {
        numCastles += 1
        if land[index] > land[index+1] {
          // 21
          peaks.append([land[0]])

        } else if land[index] < land[index+1] {
          // 12
          valleys.append([land[0]])
        } else {
          if land.count > 2 {
            // 11*
            castle.append(land[index])
          } else {
            // 11
            peaks.append(land)
          }
        }
      } else {
        if land[index-1] < land[index] {
          // 23*
          if land[index] < land[index+1] {
            // 234
          } else if land[index] > land[index+1] {
            // 232
            peaks.append([land[index]])
            numCastles += 1
          } else {
            // 233
            maybe = .peak
            castle.append(land[index])
          }

        } else if land[index-1] > land[index] {
          // 32*
          if land[index] > land[index+1] {
            // 321
          } else if land[index] < land[index+1] {
            // 323
            valleys.append([land[index]])
            numCastles += 1
          } else {
            // 322
            maybe = .valley
            castle.append(land[index])
          }
        } else {
          // 22*
          if land[index] > land[index+1] {
            // 221
            if maybe == .peak {
              castle.append(land[index])
              peaks.append(castle)
              numCastles += 1
            }
            castle = []
            maybe = .none
          } else if land[index] < land[index+1] {
            // 223
            if maybe == .valley {
              castle.append(land[index])
              valleys.append(castle)
              numCastles += 1
            }
            castle = []
            maybe = .none
          } else {
            // 222
            castle.append(land[index])
          }
        }
      }
    }
    return (peaks, valleys, numCastles)
  }
}
