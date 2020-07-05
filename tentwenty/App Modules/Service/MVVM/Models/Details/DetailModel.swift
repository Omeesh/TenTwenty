//
//  DetailModel.swift
//
//  Created by Omeesh Sharma on 05/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public struct DetailModel {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kDetailModelBudgetKey: String = "budget"
  private let kDetailModelBackdropPathKey: String = "backdrop_path"
  private let kDetailModelRevenueKey: String = "revenue"
  private let kDetailModelVoteCountKey: String = "vote_count"
  private let kDetailModelOverviewKey: String = "overview"
  private let kDetailModelVoteAverageKey: String = "vote_average"
  private let kDetailModelVideoKey: String = "video"
  private let kDetailModelImdbIdKey: String = "imdb_id"
  private let kDetailModelInternalIdentifierKey: String = "id"
  private let kDetailModelVideosKey: String = "videos"
  private let kDetailModelTitleKey: String = "title"
  private let kDetailModelHomepageKey: String = "homepage"
  private let kDetailModelProductionCompaniesKey: String = "production_companies"
  private let kDetailModelAdultKey: String = "adult"
  private let kDetailModelPosterPathKey: String = "poster_path"
  private let kDetailModelBelongsToCollectionKey: String = "belongs_to_collection"
  private let kDetailModelGenresKey: String = "genres"
  private let kDetailModelSpokenLanguagesKey: String = "spoken_languages"
  private let kDetailModelStatusKey: String = "status"
  private let kDetailModelRuntimeKey: String = "runtime"
  private let kDetailModelOriginalTitleKey: String = "original_title"
  private let kDetailModelReleaseDateKey: String = "release_date"
  private let kDetailModelOriginalLanguageKey: String = "original_language"
  private let kDetailModelPopularityKey: String = "popularity"
  private let kDetailModelTaglineKey: String = "tagline"
  private let kDetailModelProductionCountriesKey: String = "production_countries"

  // MARK: Properties
  public var budget: Int?
  public var backdropPath: String?
  public var revenue: Int?
  public var voteCount: Int?
  public var overview: String?
  public var voteAverage: Float?
  public var video: Bool = false
  public var imdbId: String?
  public var internalIdentifier: Int?
  public var videos: DetailVideos?
  public var title: String?
  public var homepage: String?
  public var productionCompanies: [DetailProductionCompanies]?
  public var adult: Bool = false
  public var posterPath: String?
  public var belongsToCollection: DetailBelongsToCollection?
  public var genres: [DetailGenres]?
  public var spokenLanguages: [DetailSpokenLanguages]?
  public var status: String?
  public var runtime: Int?
  public var originalTitle: String?
  public var releaseDate: String?
  public var originalLanguage: String?
  public var popularity: Float?
  public var tagline: String?
  public var productionCountries: [DetailProductionCountries]?

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
    budget = json[kDetailModelBudgetKey].int
    backdropPath = json[kDetailModelBackdropPathKey].string
    revenue = json[kDetailModelRevenueKey].int
    voteCount = json[kDetailModelVoteCountKey].int
    overview = json[kDetailModelOverviewKey].string
    voteAverage = json[kDetailModelVoteAverageKey].float
    video = json[kDetailModelVideoKey].boolValue
    imdbId = json[kDetailModelImdbIdKey].string
    internalIdentifier = json[kDetailModelInternalIdentifierKey].int
    videos = DetailVideos(json: json[kDetailModelVideosKey])
    title = json[kDetailModelTitleKey].string
    homepage = json[kDetailModelHomepageKey].string
    if let items = json[kDetailModelProductionCompaniesKey].array { productionCompanies = items.map { DetailProductionCompanies(json: $0) } }
    adult = json[kDetailModelAdultKey].boolValue
    posterPath = json[kDetailModelPosterPathKey].string
    belongsToCollection = DetailBelongsToCollection(json: json[kDetailModelBelongsToCollectionKey])
    if let items = json[kDetailModelGenresKey].array { genres = items.map { DetailGenres(json: $0) } }
    if let items = json[kDetailModelSpokenLanguagesKey].array { spokenLanguages = items.map { DetailSpokenLanguages(json: $0) } }
    status = json[kDetailModelStatusKey].string
    runtime = json[kDetailModelRuntimeKey].int
    originalTitle = json[kDetailModelOriginalTitleKey].string
    releaseDate = json[kDetailModelReleaseDateKey].string
    originalLanguage = json[kDetailModelOriginalLanguageKey].string
    popularity = json[kDetailModelPopularityKey].float
    tagline = json[kDetailModelTaglineKey].string
    if let items = json[kDetailModelProductionCountriesKey].array { productionCountries = items.map { DetailProductionCountries(json: $0) } }
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = budget { dictionary[kDetailModelBudgetKey] = value }
    if let value = backdropPath { dictionary[kDetailModelBackdropPathKey] = value }
    if let value = revenue { dictionary[kDetailModelRevenueKey] = value }
    if let value = voteCount { dictionary[kDetailModelVoteCountKey] = value }
    if let value = overview { dictionary[kDetailModelOverviewKey] = value }
    if let value = voteAverage { dictionary[kDetailModelVoteAverageKey] = value }
    dictionary[kDetailModelVideoKey] = video
    if let value = imdbId { dictionary[kDetailModelImdbIdKey] = value }
    if let value = internalIdentifier { dictionary[kDetailModelInternalIdentifierKey] = value }
    if let value = videos { dictionary[kDetailModelVideosKey] = value.dictionaryRepresentation() }
    if let value = title { dictionary[kDetailModelTitleKey] = value }
    if let value = homepage { dictionary[kDetailModelHomepageKey] = value }
    if let value = productionCompanies { dictionary[kDetailModelProductionCompaniesKey] = value.map { $0.dictionaryRepresentation() } }
    dictionary[kDetailModelAdultKey] = adult
    if let value = posterPath { dictionary[kDetailModelPosterPathKey] = value }
    if let value = belongsToCollection { dictionary[kDetailModelBelongsToCollectionKey] = value.dictionaryRepresentation() }
    if let value = genres { dictionary[kDetailModelGenresKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = spokenLanguages { dictionary[kDetailModelSpokenLanguagesKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = status { dictionary[kDetailModelStatusKey] = value }
    if let value = runtime { dictionary[kDetailModelRuntimeKey] = value }
    if let value = originalTitle { dictionary[kDetailModelOriginalTitleKey] = value }
    if let value = releaseDate { dictionary[kDetailModelReleaseDateKey] = value }
    if let value = originalLanguage { dictionary[kDetailModelOriginalLanguageKey] = value }
    if let value = popularity { dictionary[kDetailModelPopularityKey] = value }
    if let value = tagline { dictionary[kDetailModelTaglineKey] = value }
    if let value = productionCountries { dictionary[kDetailModelProductionCountriesKey] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
