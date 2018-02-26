//
//  WetherInfoVC.swift
//  LoadProject
//
//  Created by tigris on 2018. 1. 25..
//  Copyright © 2018년 SeungSAMI. All rights reserved.
//
//appKey : 29a8dbb4-0629-33a2-8f10-66b39a7273bf
import UIKit
import Alamofire

class WetherInfoVC: UIViewController {
    let weatherURL = "http://apis.skplanetx.com/weather/current/minutely"
    let appKey = "29a8dbb4-0629-33a2-8f10-66b39a7273bf"
    override func viewDidLoad() {
        super.viewDidLoad()
        print(requestREST())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestREST(){
        
        let param = [
            "version" :"1",
            "city" :"서울",
            "country" :"강남구",
            "vilage" :"도곡동"
        ]
        
//        Alamofire.request("https://servername.org/post", method: .post, parameters: [:], encoding: JSONEncoding.default)
        
//        Alamofire.request(weatherURL, method: .get, parameters: param, encoding: JSONEncoding.default)
        Alamofire.request(weatherURL, method: .get, parameters: param, encoding: JSONEncoding.default, headers: ["appKey" : appKey])
//            .responseJSON { (response) in
//            switch response.result {
//                case .Success(let JSON):
//                print("Success with JSON: \(JSON)")
//
//                case .Failure(let JSON):
//                print("Request Fail with error: \(JSON)")
//            }
//        }

//        Alamofire.request(
//            .GET,
//            weatherURL,
//            parameters: param,
//            encoding: .URL,
//            headers: ["appKey":appKey])
//            .responseJSON { (response) in
//            switch response.result {
//            case .Success(let JSON):
//                print("Success with JSON: \(JSON)")
//
//            case .Failure(let JSON):
//                print("Request Fail with error: \(JSON)")
//            }

//        }
        
    }


}
