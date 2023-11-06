import Foundation

public struct Input {

  public let lines: [String]
  public let testing: Bool
}

extension Bundle {

  func url(forDirectory directory: String) throws -> URL {

    return url(forResource: directory, withExtension: nil)!
  }

  public func input(named name: String, extension: String = "txt") throws -> Input {

    let url = try self.url(forDirectory: "Inputs")
      .appendingPathComponent(name)
      .appendingPathExtension(`extension`)

    return try Input(url: url)
  }
}

extension Input {
  public var integers: [Int] { lines.map { Int($0)! } }
  public var characters: [Character] { lines.flatMap { $0 } }
}

extension Input {

  public init(url: URL) throws {

    let data = try Data(contentsOf: url)
    let string = String(data: data, encoding: .utf8)!

    testing = false
    lines =
      string
      .trimmingCharacters(in: .newlines)
      .components(separatedBy: .newlines)
  }
}

extension Input: ExpressibleByArrayLiteral {

  public init(arrayLiteral elements: String...) {
    testing = true
    lines = elements
  }
}

extension Input: ExpressibleByStringLiteral {

  public init(stringLiteral value: String) {
    testing = true
    lines =
      value
      .components(separatedBy: ",")
      .map { $0.trimmingCharacters(in: .whitespaces) }
  }
}

public protocol Day {
  static var title: String { get }
}
