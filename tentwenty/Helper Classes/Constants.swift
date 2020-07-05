//
//  Constants.swift
//  tentwenty
//
//  Created by Omeesh Sharma on 29/06/20.
//  Copyright © 2020 Omeesh Sharma. All rights reserved.
//

import UIKit

let BaseURL = "https://api.themoviedb.org/3/movie/"
let ApiKey = "8f71f5120a049db7c5b3e406a49480b1"
let imagePrefix = "https://image.tmdb.org/t/p/w500"
let videoPrefix = "https://www.youtube.com/watch?v="

enum API:String{
    case moviesList = "https://api.themoviedb.org/3/movie/popular?api_key="
    case movieDetail = "https://api.themoviedb.org/3/movie/"
}

enum DetailType : String{
    case Genres = "Genres"
    case Date = "Date"
    case Overview = "Overview"
}

let rootVC = UIApplication.shared.windows.first?.rootViewController
