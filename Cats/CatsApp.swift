//
//  CatsApp.swift
//  Cats
//
//  Created by Sebastian Dąbrowski on 16.05.2024.
//

import SwiftUI

@main
struct CatsApp: App {
     @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
