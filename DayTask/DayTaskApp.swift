//
//  DayTaskApp.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 05/05/2025.
//

import SwiftUI

@main
struct DayTaskApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
  
  init() {
    let navbarAppearance = UINavigationBarAppearance()
//    navbarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//    navbarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    navbarAppearance.backgroundColor = UIColor(Color.dayTask)
    UINavigationBar.appearance().standardAppearance = navbarAppearance
    UINavigationBar.appearance().compactAppearance = navbarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navbarAppearance
  }
}
