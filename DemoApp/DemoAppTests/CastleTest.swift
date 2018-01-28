//
//  CastleText.swift
//  DemoAppTests
//
//  Created by Ty Sang on 2018-01-27.
//  Copyright © 2018 Ty Sang. All rights reserved.
//

import XCTest
@testable import DemoApp

class CastleTest: XCTestCase {

  var castleAnalyzer: CastleAnalyzer!
  override func setUp() {
    super.setUp()
    castleAnalyzer = CastleAnalyzer()
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testLand1() {

    let land = [1,2,3,4,4,4,4,4,2,2,2,1]
    let (peaks, valleys, numCastles) = castleAnalyzer.landAnalyze(land: land)

    XCTAssertEqual(peaks.count, 1)
    XCTAssertEqual(peaks.first!, [4,4,4,4,4])
    XCTAssertEqual(valleys.count, 1)
    XCTAssertEqual(valleys.first!, [1])
    XCTAssertEqual(numCastles, 2)
  }

  func testLand2() {

    let land = [1,1,1,1,1,1]
    let (peaks, valleys, numCastles) = castleAnalyzer.landAnalyze(land: land)

    XCTAssertEqual(peaks.count, 0)
    XCTAssertEqual(valleys.count, 1)
    XCTAssertEqual(numCastles, 1)
  }


  func testLand3() {

    let land = [2,4,4,4,4,2]
    let (peaks, valleys, numCastles) = castleAnalyzer.landAnalyze(land: land)

    XCTAssertEqual(peaks.count, 1)
    XCTAssertEqual(valleys.count, 1)
    XCTAssertEqual(numCastles, 2)

    XCTAssertEqual(peaks.first!, [4,4,4,4])
  }

  func testLand4() {

    let land = [3,3,4,4,3,1,3,1,2,2]
    let (peaks, valleys, numCastles) = castleAnalyzer.landAnalyze(land: land)

    XCTAssertEqual(peaks.count, 2)
    XCTAssertEqual(valleys.count, 3)
    XCTAssertEqual(numCastles, 5)

    XCTAssertEqual(valleys.first!, [3,3])
  }


  func testLand5() {

    let land = [3,3,3,1]
    let (peaks, valleys, numCastles) = castleAnalyzer.landAnalyze(land: land)

    XCTAssertEqual(peaks.count, 1)
    XCTAssertEqual(valleys.count, 0)
    XCTAssertEqual(numCastles, 1)

  }

  func testLand6() {

    let land = [3,3]
    let (peaks, valleys, numCastles) = castleAnalyzer.landAnalyze(land: land)

    XCTAssertEqual(peaks.count, 0)
    XCTAssertEqual(valleys.count, 1)
    XCTAssertEqual(numCastles, 1)

  }

  func testLand7() {

    let land = [3]
    let (peaks, valleys, numCastles) = castleAnalyzer.landAnalyze(land: land)

    XCTAssertEqual(peaks.count, 0)
    XCTAssertEqual(valleys.count, 1)
    XCTAssertEqual(numCastles, 1)

  }
}
