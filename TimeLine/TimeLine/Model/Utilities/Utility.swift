//
//  Utility.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation
import UIKit
import Photos
import CoreLocation

final class Utility {
    /**
     Method to execute a task on main queue after a delay, can be used in place of perform selector for better performance.
     - parameter delay: A double value of time you want to perform the task after the current time
     - parameter task: A closure that encloses tha task you want to perform
     
     */
    static func executeTaskOnMainThread(after delay: Double, task: @escaping ()-> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { task() }
    }
    
    /**
     Method to execute a task on main queue after a delay, can be used in place of perform selector for better performance.
     - parameter delay: A double value of time you want to perform the task after the current time
     - parameter task: A closure that encloses tha task you want to perform
     */
    static func executeTaskOnBackgroundThread(after delay: Double, task: @escaping ()-> Void) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + delay) { task() }
    }
    
    /**
     Method to open the settings application
     */
    static let methodToOpenSettings = {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        if #available(iOS 10, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: {
                (success) in })
        } else {
            guard UIApplication.shared.openURL(url) else {
                return
            }
        }
    }
    
    static func moveToSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        if #available(iOS 10, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: {
                (success) in })
        } else {
            guard UIApplication.shared.openURL(url) else {
                return
            }
        }
    }
    
    static func showAlert(message : String , completion : NullableCompletion) {
        let alert = UIAlertController(
            title: "Maskfit AR",
            message: message,
            preferredStyle: .alert
        )
        

        let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            if let actionToPerform = completion {
                actionToPerform()
            }
        }
        alert.addAction(alertAction)

        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

