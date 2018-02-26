//
//  BusViewController.swift
//  LoadProject
//
//  Created by tigris on 2018. 1. 23..
//  Copyright © 2018년 SeungSAMI. All rights reserved.
//

import UIKit
import Alamofire


class BusTimeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let testURL = "http://openapi.gbis.go.kr/ws/rest/busarrivalservice/station?serviceKey=VGmONan4q%2B58bXscOt7QporW2ArjXdDI4ZGdk%2F6VDOcaHD9lqYDIu7zzFjm2vVY23QEGtW5VKOJG7Egi9stEJQ%3D%3D&stationId=233001450"
        let encodingSt = testURL.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        
        print("enconding : \(encodingSt)")
        
        
        // Do any additional setup after loading the view.
    }
    

}


//"http://openapi.gbis.go.kr/ws/rest/busarrivalservice/station?serviceKey=test&stationId=233001450"
//VGmONan4q%2B58bXscOt7QporW2ArjXdDI4ZGdk%2F6VDOcaHD9lqYDIu7zzFjm2vVY23QEGtW5VKOJG7Egi9stEJQ%3D%3D


/*
import UIKit

class BusTimeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ODsayService.sharedInst().setApiKey("5WwMC4ECDPo7ghy3D8P+1Q")     //SDK 인증
        ODsayService.sharedInst().setTimeout(5000)    //통신 타임아웃 설정
        
        ODsayService.sharedInst().requestBusLaneDetail("12018") {
            (retCode:Int32, resultDic:[AnyHashable : Any]?) in
            if retCode == 200 {
                print(resultDic!.description)
            } else {
                print(resultDic!.description)
            }
        }

        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
 */
