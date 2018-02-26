//
//  StStationTimeVC.swift
//  LoadProject
//
//  Created by tigris on 2018. 1. 24..
//  Copyright © 2018년 SeungSAMI. All rights reserved.
//

import UIKit
import WebKit

class StStationTimeVC: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    var wkWebView:WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wkWebView = WKWebView(frame:contentView.frame)
        contentView.addSubview(wkWebView)
        constrainView(view: wkWebView, toView: contentView)
        getURL()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func FirstView(_ sender: Any) {
        getURL()
    }
    
    func constrainView(view:UIView, toView contentView:UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    
    
    func getURL(){
        
        let address = "http://m.gbis.go.kr/search/StationArrivalViaList.do?stationId=210000421&stationName=%EA%B0%80%ED%86%A8%EB%A6%AD%EB%8C%80%ED%95%99%EA%B5%90&regionName=%EB%B6%80%EC%B2%9C&districtCd=2&mobileNo=11416&mobileNoSi=&x=126.8046&y=37.4858333&osInfoType=M"
        let url = URL(string: address)
        let request = URLRequest(url: url!)
        
        wkWebView.load(request)
    }
    
}

