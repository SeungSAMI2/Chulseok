//
//  WeatherInfo.swift
//  LoadProject
//
//  Created by tigris on 2018. 1. 25..
//  Copyright © 2018년 SeungSAMI. All rights reserved.
//

import Foundation
import Alamofire

class NCWeatherManager: NSObject {
    let weatherURL = "http://apis.skplanetx.com/weather/current/minutely"
    let appKey = "29a8dbb4-0629-33a2-8f10-66b39a7273bf"

    func requestREST(){
        
        let param = [
            "version" :"1",
            "city" :"서울",
            "country" :"강남구",
            "vilage" :"도곡동"
        ]
        Alamofire.request("https://httpbin.org/get")

        


//        Alamofire.request(.GET, weatherURL, parameters: param, encoding: .URL, headers: ["appKey":appKey]).responseJSON { (response) in
//            switch response.result {
//            case .Success(let JSON):
//                print("Success with JSON: \(JSON)")
//
//            case .Failure(let JSON):
//                print("Request Fail with error: \(JSON)")
//            }
//
//        }
    }

    
    
    
}


