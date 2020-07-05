//
//  DetailResults.swift
//
//  Created by Omeesh Sharma on 05/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct DetailResults {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kDetailResultsNameKey: String = "name"
  private let kDetailResultsInternalIdentifierKey: String = "id"
  private let kDetailResultsKeyKey: String = "key"
  private let kDetailResultsIso31661Key: String = "iso_3166_1"
  private let kDetailResultsSizeKey: String = "size"
  private let kDetailResultsIso6391Key: String = "iso_639_1"
  private let kDetailResultsTypeKey: String = "type"
  private let kDetailResultsSiteKey: String = "site"

  // MARK: Properties
  public var name: String?
  public var internalIdentifier: String?
  public var key: String?
  public var iso31661: String?
  public var size: Int?
  public var iso6391: String?
  public var type: String?
  public var site: String?

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
    name = json[kDetailResultsNameKey].string
    internalIdentifier = json[kDetailResultsInternalIdentifierKey].string
    key = json[kDetailResultsKeyKey].string
    iso31661 = json[kDetailResultsIso31661Key].string
    size = json[kDetailResultsSizeKey].int
    iso6391 = json[kDetailResultsIso6391Key].string
    type = json[kDetailResultsTypeKey].string
    site = json[kDetailResultsSiteKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[kDetailResultsNameKey] = value }
    if let value = internalIdentifier { dictionary[kDetailResultsInternalIdentifierKey] = value }
    if let value = key { dictionary[kDetailResultsKeyKey] = value }
    if let value = iso31661 { dictionary[kDetailResultsIso31661Key] = value }
    if let value = size { dictionary[kDetailResultsSizeKey] = value }
    if let value = iso6391 { dictionary[kDetailResultsIso6391Key] = value }
    if let value = type { dictionary[kDetailResultsTypeKey] = value }
    if let value = site { dictionary[kDetailResultsSiteKey] = value }
    return dictionary
  }

}
