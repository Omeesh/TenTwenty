//
//  MovieListModel.swift
//
//  Created by Omeesh Sharma on 29/06/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct MovieListModel {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kMovieListModelPosterPathKey: String = "poster_path"
  private let kMovieListModelBackdropPathKey: String = "backdrop_path"
  private let kMovieListModelGenreIdsKey: String = "genre_ids"
  private let kMovieListModelVoteCountKey: String = "vote_count"
  private let kMovieListModelOverviewKey: String = "overview"
  private let kMovieListModelOriginalTitleKey: String = "original_title"
  private let kMovieListModelVoteAverageKey: String = "vote_average"
  private let kMovieListModelPopularityKey: String = "popularity"
  private let kMovieListModelInternalIdentifierKey: String = "id"
  private let kMovieListModelOriginalLanguageKey: String = "original_language"
  private let kMovieListModelReleaseDateKey: String = "release_date"
  private let kMovieListModelVideoKey: String = "video"
  private let kMovieListModelTitleKey: String = "title"
  private let kMovieListModelAdultKey: String = "adult"

  // MARK: Properties
  public var posterPath: String?
  public var backdropPath: String?
  public var genreIds: [Int]?
  public var voteCount: Int?
  public var overview: String?
  public var originalTitle: String?
  public var voteAverage: Float?
  public var popularity: Float?
  public var internalIdentifier: Int?
  public var originalLanguage: String?
  public var releaseDate: String?
  public var video: Bool = false
  public var title: String?
  public var adult: Bool = false

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
    posterPath = json[kMovieListModelPosterPathKey].string
    backdropPath = json[kMovieListModelBackdropPathKey].string
    if let items = json[kMovieListModelGenreIdsKey].array { genreIds = items.map { $0.intValue } }
    voteCount = json[kMovieListModelVoteCountKey].int
    overview = json[kMovieListModelOverviewKey].string
    originalTitle = json[kMovieListModelOriginalTitleKey].string
    voteAverage = json[kMovieListModelVoteAverageKey].float
    popularity = json[kMovieListModelPopularityKey].float
    internalIdentifier = json[kMovieListModelInternalIdentifierKey].int
    originalLanguage = json[kMovieListModelOriginalLanguageKey].string
    releaseDate = json[kMovieListModelReleaseDateKey].string
    video = json[kMovieListModelVideoKey].boolValue
    title = json[kMovieListModelTitleKey].string
    adult = json[kMovieListModelAdultKey].boolValue
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = posterPath { dictionary[kMovieListModelPosterPathKey] = value }
    if let value = backdropPath { dictionary[kMovieListModelBackdropPathKey] = value }
    if let value = genreIds { dictionary[kMovieListModelGenreIdsKey] = value }
    if let value = voteCount { dictionary[kMovieListModelVoteCountKey] = value }
    if let value = overview { dictionary[kMovieListModelOverviewKey] = value }
    if let value = originalTitle { dictionary[kMovieListModelOriginalTitleKey] = value }
    if let value = voteAverage { dictionary[kMovieListModelVoteAverageKey] = value }
    if let value = popularity { dictionary[kMovieListModelPopularityKey] = value }
    if let value = internalIdentifier { dictionary[kMovieListModelInternalIdentifierKey] = value }
    if let value = originalLanguage { dictionary[kMovieListModelOriginalLanguageKey] = value }
    if let value = releaseDate { dictionary[kMovieListModelReleaseDateKey] = value }
    dictionary[kMovieListModelVideoKey] = video
    if let value = title { dictionary[kMovieListModelTitleKey] = value }
    dictionary[kMovieListModelAdultKey] = adult
    return dictionary
  }

}
