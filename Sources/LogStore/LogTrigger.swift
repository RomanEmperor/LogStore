//
//  LogTrigger.swift
//  
//
//  Created by Roman Parajuli on 10/20/20.
//

import UIKit
import CoreMotion

/// Defining a class with two properties, One of type UIWindow and one of type CMMotionManager.
/// The window is passed into this class through the initializer.
public class LogTrigger {
    
    let window: UIWindow?
    let motionManager = CMMotionManager()
    
    public init(in window: UIWindow?) {
        self.window = window
        
    
        motionManager.startAccelerometerUpdates(to: .main) { [weak self] data, error in
            guard let data = data else { return }
            if data.acceleration.x < -5 {
                printLog("x acceleration: \(data.acceleration.x)")
                self?.presentLog()
            }
        }
    }
    
    func presentLog() {
        
        let visible = visibleViewController(from: window?.rootViewController)
        let logViewController = LogViewController()
        visible?.present(logViewController, animated: true)
        
    }
    
    func visibleViewController( from viewController: UIViewController?) -> UIViewController? {
        
        // Checking if the passed-in view controller is an instance of UINavigation Controller.
        if let navigationController = viewController as? UINavigationController {
            
            // A UINavigationController manages several view controllers in a navigation stack
            // The topViewController property itself could not present another view controller modally, we need to call visibleViewController(from:)
            return visibleViewController(from: navigationController.topViewController)
        }
        
        // If the passed-in view controller is an instance of UITabBarController, call the method again with the selected view controller, as this is the view controller for the selected tab.
        
        if let tabBarController = viewController as? UITabBarController {
            return visibleViewController(from: tabBarController.selectedViewController)
        }
        
        // If presented View controller of the passed-in view controller is set, we call the method again with this.
        if let presentedViewController = viewController?.presentedViewController {
            return visibleViewController(from: presentedViewController)
        }
        
        // if neither cases applies, we have found the visible view controller.
        
        return viewController
    }
}
