//
//  CoordinatorTests.swift
//  Shifty-Tests
//
//  Created by William McGinty on 12/29/17.
//  Copyright © 2017 Will McGinty. All rights reserved.
//

import XCTest
@testable import Shifty

//class CoordinatorTests: XCTestCase {
//
//    func testDefaultCoordinatorMatchingEmptyInput() {
//        let coord = DefaultCoordinator()
//        let shifts = coord.shifts(from: [], to: [])
//        XCTAssertEqual(shifts, [])
//    }
//
//    func testDefaultCoordinatorMatchingInputs() {
//        let c = DefaultCoordinator()
//        let s = c.shifts(from: [State(view: UIView(), identifier: "id2"),
//                                State(view: UIView(), identifier: "id")], to: [State(view: UIView(), identifier: "id")])
//        XCTAssertEqual(s.count, 1)
//        XCTAssertTrue(s.first!.source.identifier == AnyHashable("id"))
//        XCTAssertTrue(s.first!.destination.identifier == AnyHashable("id"))
//        XCTAssertFalse(s.contains(where: { $0.source.identifier == AnyHashable("id2") }))
//    }
//
//    func testDefaultCoordinatorNoMatchingInputs() {
//        let c = DefaultCoordinator()
//        let s = c.shifts(from: [State(view: UIView(), identifier: "id2")], to: [State(view: UIView(), identifier: "id")])
//        XCTAssertTrue(s.isEmpty)
//    }
//}
