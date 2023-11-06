import Advent
import XCTest
import Year2022

final class Day02Tests: XCTestCase {

  func testPart1Examples() throws {
    XCTAssertEqual(
      try Day02.part1([
        "A Y",
        "B X",
        "C Z",
      ]), 15)
  }

  func testPart1Puzzle() throws {
    let input = try Bundle.module.input(named: "Day02")
    XCTAssertEqual(try Day02.part1(input), 12855)
  }

  func testPart2Examples() throws {
    XCTAssertEqual(
      try Day02.part2([
        "A Y",
        "B X",
        "C Z",
      ]), 12)
  }

  func testPart2Puzzle() throws {
    let input = try Bundle.module.input(named: "Day02")
    XCTAssertEqual(try Day02.part2(input), 13726)
  }
}
