//
//  NotificationExtentsion.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation

// MARK:- Notification Name for pop to root view
extension Notification.Name {
    static let periodValueChangedForMenu : Notification.Name = Notification.Name(rawValue: "periodValueChangedNotification")
    static let periodValueChanged : Notification.Name = Notification.Name(rawValue: "periodValueChangedNotificationForMenu")
}
