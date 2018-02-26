//
//  backu.swift
//  LoadProject
//
//  Created by tigris on 2018. 2. 20..
//  Copyright © 2018년 SeungSAMI. All rights reserved.
//

import Foundation



//            self.center.getNotificationSettings { (settings) in // 승인 관리
//                if settings.authorizationStatus != .authorized {
//                    // Notifications not allowed
//                }
//            }
//
//            let content = UNMutableNotificationContent() // 표시되는 내용
//            content.title = "Don't forget"
//            content.body = "Buy some milk"
//            content.sound = UNNotificationSound.default()
//
//
//            let date = Date(timeIntervalSinceNow: 10)
//
//            let triggerWeekly = Calendar.current.dateComponents([.weekday, .hour, .minute, .second,], from: date)
//
//
//
//
//            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerWeekly, repeats: true)
//
//            let identifier = "UYLLocalNotification"
//            let request = UNNotificationRequest(identifier: identifier,
//                                                content: content, trigger: trigger)
//            self.center.add(request, withCompletionHandler: { (error) in
//                if let error = error {
//                    // Something went wrong
//                    print("쀼쀼")
//                }
//            })
//
