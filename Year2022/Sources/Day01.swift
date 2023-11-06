//
// Advent of Code 2022
//
// https://adventofcode.com/2022/day/1
//

import Advent
import Algorithms
import Foundation

public enum Day01: Day {
  public static let title = "Calorie Counting"

  public static func part1(_ input: Input) throws -> Int {
    try input.lines
      .split(whereSeparator: \.isEmpty)
      .map { $0.map({ s in Int.init(s)! }).sum }
      .max

  }

  public static func part2(_ input: Input) throws -> Int {
    input.lines
      .split(whereSeparator: \.isEmpty)
      .map {
        $0.map({ s in Int.init(s)! }).sum
      }
      .max(count: 3)
      .sum
  }
}
