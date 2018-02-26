////
////  AlarmVC.swift
////  LoadProject
////
////  Created by tigris on 2018. 2. 19..
////  Copyright © 2018년 SeungSAMI. All rights reserved.
////
//
//import UIKit
//import UserNotifications
//import UserNotificationsUI
//
//class AlarmVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate{
//
//    var identifier = String()
//    var arrivalTime = String()
//    var arrivalTimeList = UserDefaults.standard.array(forKey: "arrivalTimeList") as? [String] ?? [String]()
//    var identifierList = UserDefaults.standard.array(forKey: "identifierList") as? [String] ?? [String]()
//    var weekLabelList = UserDefaults.standard.array(forKey: "weekLabelList") as? [String] ?? [String]()
//
//    @IBOutlet weak var alarmTable: UITableView!
//
//
//    @IBAction func TEST(_ sender: Any) {
//        let center = UNUserNotificationCenter.current()
//        center.removePendingNotificationRequests(withIdentifiers: [identifier])
//        center.removeAllDeliveredNotifications()
//        center.removeAllPendingNotificationRequests()
//        UserDefaults.standard.removeObject(forKey: "identifierList")
//        UserDefaults.standard.removeObject(forKey: "arrivalTimeList")
//        UserDefaults.standard.removeObject(forKey: "nameLabel")
//        UserDefaults.standard.removeObject(forKey: "weekLabelList")
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if identifierList.count == 0 {
//            tableView.separatorStyle = UITableViewCellSeparatorStyle.none
//        }
//        else {
//            tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
//        }
//
//        return identifierList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "alarmInfo", for: indexPath)
//        if identifierList.isEmpty {
//            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "alarmInfo")
//        }
//
//        cell.selectionStyle = .none
//        cell.tag = indexPath.row
//
//        let alarm = identifierList[indexPath.row]
//        let time = "\(weekLabelList[indexPath.row])   \(arrivalTimeList[indexPath.row])"
//        let amAttr: [NSAttributedStringKey : Any] = [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue) : UIFont.systemFont(ofSize: 20.0)]
//        let str = NSMutableAttributedString(string: time , attributes: amAttr)
//        let timeAttr: [NSAttributedStringKey : Any] = [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue) : UIFont.systemFont(ofSize: 45.0)]
//
//        str.addAttributes(timeAttr, range: NSMakeRange(0, str.length-2))
//        cell.textLabel?.attributedText = str
//        cell.detailTextLabel?.text = alarm
//
//        return cell
//    }
//
//
//
//
//    let center = UNUserNotificationCenter.current() // 객체 생성
//    let options: UNAuthorizationOptions = [.alert, .sound, .badge]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        UNUserNotificationCenter.current().delegate = self // 앱이 실행된 상태에서도 출현
//        alarmTable.delegate = self
//        alarmTable.dataSource = self
//
//        UserDefaults.standard.removeObject(forKey: "routeTime")
//        UserDefaults.standard.removeObject(forKey: "TransitMode")
//        UserDefaults.standard.removeObject(forKey: "sinceTime")
//
//        print("여기 \(identifier)")
//        UserDefaults.standard.removeObject(forKey: "routeTimeValue")
//
//
//        }
//    var weekLabel = String()
//    func addAlarm(){
////        identifierList = UserDefaults.standard.array(forKey: "identifierList")
////            as? [String] ?? [String]()
//
//        let alarmTimeSecond = UserDefaults.standard.integer(forKey: "alarmTime")
//        let weekday = UserDefaults.standard.integer(forKey: "weekday")
//
//        switch weekday {
//        case 1:
//            weekLabel = "일"
//        case 2:
//            weekLabel = "월"
//        case 3:
//            weekLabel = "화"
//        case 4:
//            weekLabel = "수"
//        case 5:
//            weekLabel = "목"
//        case 6:
//            weekLabel = "금"
//        case 7:
//            weekLabel = "토"
//
//        default:
//            print("error")
//        }
//
//        weekLabelList.insert(weekLabel, at: 0)
//        UserDefaults.standard.set(weekLabelList, forKey: "weekLabelList")
//
//        identifierList.insert(identifier, at: 0)
//        UserDefaults.standard.set(identifierList, forKey: "identifierList")
//
//        arrivalTimeList.insert(arrivalTime, at: 0)
//        UserDefaults.standard.set(arrivalTimeList, forKey: "arrivalTimeList")
//
//        let departureHour = alarmTimeSecond / 3600
//        let departureMinute = alarmTimeSecond % 3600 / 60
//
//
//        center.requestAuthorization(options: options) { // 승인 요청
//            (granted, error) in
//            if !granted {
//                print("Something went wrong")
//            }
//        }
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: DateComponents(hour: departureHour, minute: departureMinute, weekday: weekday), repeats: true)
//
//        print(trigger.nextTriggerDate() ?? "nil")
//
//        let content = UNMutableNotificationContent()
//        content.title = "\(identifier)"
//        content.body = "지금 출발하시면 \(arrivalTime)에 도착할 수 있어요!"
//
//        // make sure you give each request a unique identifier. (nextTriggerDate description)
//        let request = UNNotificationRequest(identifier: "\(identifier)", content: content, trigger: trigger)
//
//
//
//        UNUserNotificationCenter.current().add(request) { error in
//            if let error = error {
//                print(error)
//                return
//            }
//            print("rrrrrrrrrrrrrr")
//        }
//    }
//
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//}
//
//extension AlarmVC:UNUserNotificationCenterDelegate{
//
//
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//
//        print("Tapped in notification")
//    }
//
//    //This is key callback to present notification while the app is in foreground
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//
//        print("Notification being triggered")
//        //You can either present alert ,sound or increase badge while the app is in foreground too with ios 10
//        //to distinguish between notifications
//        if notification.request.identifier == identifier{
//
//            completionHandler( [.alert,.sound,.badge])
//
//        }
//    }
//}

