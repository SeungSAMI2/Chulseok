//
//  NStationTimeVC.swift
//  LoadProject
//
//  Created by tigris on 2018. 1. 24..
//  Copyright © 2018년 SeungSAMI. All rights reserved.
//

import UIKit
import WebKit

class NStationTimeVC: UIViewController {

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
        
        let address = "http://m.gbis.go.kr/search/StationArrivalViaList.do?stationId=210000416&stationName=%EC%97%AD%EA%B3%A1%EC%97%AD%EB%B6%81%EB%B6%80&regionName=%EB%B6%80%EC%B2%9C&districtCd=2&mobileNo=11406&mobileNoSi=&x=126.8116&y=37.4856167&osInfoType=M"
        let url = URL(string: address)
        let request = URLRequest(url: url!)
        
        wkWebView.load(request)
    }
    
    
    
}
