 //
 //  ApiManager.swift
 
 
 import UIKit
 import Alamofire
 import SwiftyJSON
 
 
 //MARK:- Api Keys
 //=======================
 struct ApiCode {
    
    static var success: Int                     { return 200 } // Success
    static var invalidCredentials: Int          { return 204 } // Invalid Password
    static var otpExpired: Int                  { return 401 } // Unauthorised
    static var userAlreadyExist: Int            { return 403 } // User Already Exist
    static var NoDataFound: Int                 { return 404 } // Action Not Defined
    static var ssnAlreadyExist: Int             { return 409 } // SSN Already Exist
    static var fieldValidationFailed: Int       { return 422 } // Field Validation Failed
    static var serverError: Int                 { return 500 } // Failure Message
    static var otpNotUpdate: Int                { return 503 } // Could Not Update
    
 }
 
 class ApiManager: NSObject {
    
    static let sharedInstance = ApiManager.init()
    
    func requestApiURL(_ strURL : String, params : [String : AnyObject]?, headers : [String : String]?,encoding: ParameterEncoding , method: HTTPMethod , success:@escaping (JSON , Int) -> Void , failure:@escaping (String , Int) -> Void){
        
        Alamofire.request(strURL, method: method, parameters: params, encoding:  encoding, headers: headers).responseJSON { (responseObject) -> Void in
            
            let statusCode = JSON(responseObject.response?.statusCode ?? 404).intValue
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                guard ((statusCode == ApiCode.success)) else{
                    let message = "Error"
                    failure(message, statusCode)
                    return
                }
                success(resJson , statusCode)
            }
            
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error.localizedDescription, statusCode)
            }
        }
    }
    
 }
 
 
 
