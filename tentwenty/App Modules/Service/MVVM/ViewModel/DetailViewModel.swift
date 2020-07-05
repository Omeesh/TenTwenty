//
//  DetailViewModel.swift
//  tentwenty
//
//  Created by Omeesh Sharma on 05/07/20.
//  Copyright © 2020 Omeesh Sharma. All rights reserved.
//

import UIKit
import Alamofire


class DetailViewModel {
    
    var detail : DetailModel?
    
    //MARK:- Get Movies List
    func getDetails(id: Int?, completion:@escaping (() -> ())) {
        let urlStr = API.movieDetail.rawValue + "\(id ?? 0)(?api_key=\(ApiKey)&append_to_response=videos"
        rootVC?.view.startProgresshud()
        
        ApiManager.sharedInstance.requestApiURL(urlStr , params: nil, headers: nil, encoding: URLEncoding.httpBody, method: .get, success: { (response, statusCode) in
            self.detail = .init(json: response)
            completion()
            rootVC?.view.stopProgressHud()
        }) { (error, statusCode) in
            completion()
            rootVC?.view.stopProgressHud()
        }
    }
    
}
