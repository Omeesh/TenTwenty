//
//  DetailProductionCompanies.swift
//
//  Created by Omeesh Sharma on 05/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct DetailProductionCompanies {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kDetailProductionCompaniesOriginCountryKey: String = "origin_country"
  private let kDetailProductionCompaniesNameKey: String = "name"
  private let kDetailProductionCompaniesInternalIdentifierKey: String = "id"
  private let kDetailProductionCompaniesLogoPathKey: String = "logo_path"

  // MARK: Properties
  public var originCountry: String?
  public var name: String?
  public var internalIdentifier: Int?
  public var logoPath: String?

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
    originCountry = json[kDetailProductionCompaniesOriginCountryKey].string
    name = json[kDetailProductionCompaniesNameKey].string
    internalIdentifier = json[kDetailProductionCompaniesInternalIdentifierKey].int
    logoPath = json[kDetailProductionCompaniesLogoPathKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = originCountry { dictionary[kDetailProductionCompaniesOriginCountryKey] = value }
    if let value = name { dictionary[kDetailProductionCompaniesNameKey] = value }
    if let value = internalIdentifier { dictionary[kDetailProductionCompaniesInternalIdentifierKey] = value }
    if let value = logoPath { dictionary[kDetailProductionCompaniesLogoPathKey] = value }
    return dictionary
  }

}
