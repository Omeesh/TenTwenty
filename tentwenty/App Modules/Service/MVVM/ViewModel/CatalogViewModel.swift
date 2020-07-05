//
//  CatalogViewModel.swift
//  tentwenty
//
//  Created by Omeesh Sharma on 29/06/20.
//  Copyright © 2020 Omeesh Sharma. All rights reserved.
//

import UIKit
import Alamofire

class CatalogViewModel {
    
    var originalcatalog = [MovieListModel]()
    var catalogArray = [MovieListModel]()
    
    var pages = [10]
    
    var firstPage = 1
    var lastPage = 0
    var apiHit = false
    
    
    //MARK:- Get Movies List
    func getList(isNext:Bool?, completion:@escaping (() -> ())) {
        var page = 0
        
        if isNext == true{
            page = (pages.last ?? 0) + 1
        } else if isNext == false{
            page = (pages.first ?? 0) - 1
        } else{
            page = (pages.last ?? 0)
        }
        
        let urlStr = API.moviesList.rawValue + ApiKey + "&page=\(page)"
        
        self.apiHit = true
        ApiManager.sharedInstance.requestApiURL(urlStr , params: nil, headers: nil, encoding: URLEncoding.httpBody, method: .get, success: { (response, statusCode) in
            self.lastPage = response["total_pages"].intValue
            
            if let data = response["results"].array{
                if isNext == false{
                    self.catalogArray.insert(contentsOf: data.map({MovieListModel.init(json: $0)}), at: 0)
                    self.pages.insert((self.pages.first ?? 0) - 1, at: 0)
                }else{
                    if isNext != nil{
                        self.pages.append((self.pages.last ?? 0) + 1)
                    }
                    self.catalogArray.append(contentsOf: data.map({MovieListModel.init(json: $0)}))
                }
            }
            
            self.apiHit = false
            self.originalcatalog = self.catalogArray
            completion()
        }) { (error, statusCode) in
            self.apiHit = false
            completion()
        }
    }
    
    func searchMovie(title: String, completion:@escaping (() -> ())) {
        guard title.isEmpty == false else{
            self.catalogArray = self.originalcatalog
            completion()
            return
        }
        self.catalogArray = self.originalcatalog.filter({$0.originalTitle?.lowercased().contains(title.lowercased()) == true})
        completion()
    }
    
}
