//
//  WebKitVideViewController.swift
//  LoadProject
//
//  Created by tigris on 2018. 1. 24..
//  Copyright © 2018년 SeungSAMI. All rights reserved.
//

import UIKit
import WebKit

class WebKitVideViewController: UIViewController, WKNavigationDelegate{
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var IndicatorView: UIActivityIndicatorView!
    
    var wkWebView:WKWebView!
    
    override func viewDidLoad() {
        IndicatorView.isHidden = true
        super.viewDidLoad()
    }
    
    
    @IBAction func LatestfVideo(_ sender: Any) {
        GetVideo(videoCode: "uO1F_olB6SI&index=7&list=PL-Dn99n6m8ehi7D0_kHFWj7gaN8ZivlUB")
    }
    
    @IBAction func First(_ sender: Any) {
        GetVideo(videoCode: "JJnqyiLyR2o&index=1&list=PL-Dn99n6m8ehi7D0_kHFWj7gaN8ZivlUB")
    }
    
    @IBAction func Second(_ sender: Any) {
        GetVideo(videoCode: "-DJdJi3yqE4&list=PL-Dn99n6m8ehi7D0_kHFWj7gaN8ZivlUB&index=2")
    }
    
    @IBAction func Third(_ sender: Any) {
        GetVideo(videoCode: "Zd9MBmLiBmM&index=3&list=PL-Dn99n6m8ehi7D0_kHFWj7gaN8ZivlUB")
    }
    
    @IBAction func Fourth(_ sender: Any) {
        GetVideo(videoCode: "8u6Lka5DHR4&index=4&list=PL-Dn99n6m8ehi7D0_kHFWj7gaN8ZivlUB")
    }

    @IBAction func Fifth(_ sender: Any) {
        GetVideo(videoCode: "m0MuIyqUW74&list=PL-Dn99n6m8ehi7D0_kHFWj7gaN8ZivlUB&index=5")
    }
    
    @IBAction func Sixth(_ sender: Any) {
        GetVideo(videoCode: "uO1F_olB6SI&list=PL-Dn99n6m8ehi7D0_kHFWj7gaN8ZivlUB&index=6")
    }
    
    func constrainView(view:UIView, toView contentView:UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
//   func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!){
//    print("staaaaaaaaaaaaasccc0")
//    IndicatorView.isHidden = false
//    IndicatorView.startAnimating()
//    }
    
    
    
//    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
//    print("staaaaaaaaaaaaasccc1")
//        IndicatorView.isHidden = false
//        IndicatorView.startAnimating()
//    }

    func GetVideo(videoCode:String){ // 영상 url받아오기, 로딩시작
        // 로딩시작
        IndicatorView.isHidden = false
        IndicatorView.startAnimating()
        print("Start Loading")
        
        // url받아오기
        wkWebView = WKWebView(frame:contentView.frame)
        contentView.addSubview(wkWebView)
        constrainView(view: wkWebView, toView: contentView)
        wkWebView.navigationDelegate = self // **indicator 표시를 위한 대리자 위임
        
        
        let address = "https://www.youtube.com/watch?v=\(videoCode)"
        let url = URL(string: address)
        let request = URLRequest(url: url!)
        
        wkWebView.load(request)
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){ // 서버를 받아오는 것이 끝날을때 하는 행동
        print("Finish")
        IndicatorView.stopAnimating()
        IndicatorView.isHidden = true
    }


    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){ // 서버를 받아오는 도중 에러가 발생했을때 하는 행동
       print("Error")
    }
}
