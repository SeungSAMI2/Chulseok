//
//  RoutesKindVC.swift
//  LoadProject
//
//  Created by tigris on 2018. 2. 7..
//  Copyright © 2018년 SeungSAMI. All rights reserved.
//

import UIKit

class RoutesKindVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var routeMainView: UITableView!
    @IBOutlet weak var routeBlurView: UIVisualEffectView!
    @IBOutlet var routeSideView: UIView!
    
    var routeTimeData:[String] = UserDefaults.standard.object(forKey: "routeTime") as? [String] ?? [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        routeBlurView.layer.cornerRadius = 15
        routeSideView.layer.shadowColor = UIColor.black.cgColor
        routeSideView.layer.shadowOpacity = 1
        routeSideView.layer.shadowOffset = CGSize(width: 5, height: 0)
        routeMainView.delegate = self
        routeMainView.dataSource = self

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        print("열갯수변경")
        var rowcount = (UserDefaults.standard.object(forKey: "routeTime") as? [String] ?? [String]()).count
//        print("열갯수")
//        print(rowcount)
//        print("열갯수 변경 끝")
        return rowcount//routeTimeData.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "routeKind", for: indexPath)
        
        //        routeTimeData = UserDefaults.standard.object(forKey: "routeTime") as? [String] ?? [String]()
//        print("셀정보변경")
//        print(indexPath.row)
        let testdata = (UserDefaults.standard.object(forKey: "routeTime") as? [String] ?? [String]())
        Cell.detailTextLabel?.text = "소요시간 "+testdata[indexPath.row]
        let indexpath = String(indexPath.row+1)
        Cell.textLabel?.text = "경로 #"+indexpath
//        print("셀정보변경 끝")
        
        // Configure the cell...
        
        return Cell
    }
    
    @IBAction func Test(_ sender: UIButton) {
//        print(UserDefaults.standard.object(forKey: "routeTime") as? [String] ?? [String]())
        routeMainView.reloadSectionIndexTitles()
        routeMainView.reloadData()
        self.viewDidLoad()
    }
    
}

