//
//  DetailSpokenLanguages.swift
//
//  Created by Omeesh Sharma on 05/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct DetailSpokenLanguages {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kDetailSpokenLanguagesIso6391Key: String = "iso_639_1"
  private let kDetailSpokenLanguagesNameKey: String = "name"

  // MARK: Properties
  public var iso6391: String?
  public var name: String?

  // MARK: SwiftyJSON Initalizers
  /**
   Initates the instance based on the object
   - parameter object: The object of either Dictionary or Array kind that was passed.
   - returns: An initalized instance of the class.
  */
  public init(object: Any) {
    self.init(json: JSON(object))
  }

  /**
   Initates the instance based on the JSON that was passed.
   - parameter json: JSON object from SwiftyJSON.
   - returns: An initalized instance of the class.
  */
  public init(json: JSON) {
    iso6391 = json[kDetailSpokenLanguagesIso6391Key].string
    name = json[kDetailSpokenLanguagesNameKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = iso6391 { dictionary[kDetailSpokenLanguagesIso6391Key] = value }
    if let value = name { dictionary[kDetailSpokenLanguagesNameKey] = value }
    return dictionary
  }

}
