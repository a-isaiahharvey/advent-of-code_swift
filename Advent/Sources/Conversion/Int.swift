import Foundation

extension Int {

  public init?(_ character: Character) {
    self.init(String(character))
  }
}

extension Int {

  public static func ascii(_ character: Character) throws -> Int {

    struct NotASCII: Error {
      let character: Character
    }

    guard let ascii = character.asciiValue else {
      throw NotASCII(character: character)
    }

    return Int(ascii)
  }
}
