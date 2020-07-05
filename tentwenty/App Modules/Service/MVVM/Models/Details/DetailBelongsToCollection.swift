//
//  DetailBelongsToCollection.swift
//
//  Created by Omeesh Sharma on 05/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct DetailBelongsToCollection {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kDetailBelongsToCollectionPosterPathKey: String = "poster_path"
  private let kDetailBelongsToCollectionNameKey: String = "name"
  private let kDetailBelongsToCollectionBackdropPathKey: String = "backdrop_path"
  private let kDetailBelongsToCollectionInternalIdentifierKey: String = "id"

  // MARK: Properties
  public var posterPath: String?
  public var name: String?
  public var backdropPath: String?
  public var internalIdentifier: Int?

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
    posterPath = json[kDetailBelongsToCollectionPosterPathKey].string
    name = json[kDetailBelongsToCollectionNameKey].string
    backdropPath = json[kDetailBelongsToCollectionBackdropPathKey].string
    internalIdentifier = json[kDetailBelongsToCollectionInternalIdentifierKey].int
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = posterPath { dictionary[kDetailBelongsToCollectionPosterPathKey] = value }
    if let value = name { dictionary[kDetailBelongsToCollectionNameKey] = value }
    if let value = backdropPath { dictionary[kDetailBelongsToCollectionBackdropPathKey] = value }
    if let value = internalIdentifier { dictionary[kDetailBelongsToCollectionInternalIdentifierKey] = value }
    return dictionary
  }

}
