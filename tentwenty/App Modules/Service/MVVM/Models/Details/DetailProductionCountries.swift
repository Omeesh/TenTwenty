//
//  DetailProductionCountries.swift
//
//  Created by Omeesh Sharma on 05/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct DetailProductionCountries {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kDetailProductionCountriesNameKey: String = "name"
  private let kDetailProductionCountriesIso31661Key: String = "iso_3166_1"

  // MARK: Properties
  public var name: String?
  public var iso31661: String?

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
    name = json[kDetailProductionCountriesNameKey].string
    iso31661 = json[kDetailProductionCountriesIso31661Key].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[kDetailProductionCountriesNameKey] = value }
    if let value = iso31661 { dictionary[kDetailProductionCountriesIso31661Key] = value }
    return dictionary
  }

}
