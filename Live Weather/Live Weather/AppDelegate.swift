//
//  AppDelegate.swift
//  Live Weather
//
//  Created by Nouman Pervez on 01/09/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

//564993aae9ff5124334196c19979be31

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().barTintColor = .systemBlue
        UIBarButtonItem.appearance().tintColor = .systemRed
        return true
    }

}

