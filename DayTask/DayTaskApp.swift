//
//  DayTaskApp.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 05/05/2025.
//

import SwiftUI
import SwiftData
//import FirebaseCore
//import Firebase

//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    
//    FirebaseApp.configure()
//    
//    return true
//  }
//}

@main
struct DayTaskApp: App {
  // register app delegete for Firebase setup
//  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  var sharedModelContainer: ModelContainer = {
      let schema = Schema([
          Task.self,
          TeamMember.self,
          TaskToDo.self
      ])
      let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

      do {
          return try ModelContainer(for: schema, configurations: [modelConfiguration])
      } catch {
          fatalError("Could not create ModelContainer: \(error)")
      }
  }()
  
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
        
    }
  
  init() { 
//    FirebaseApp.configure()
    let navbarAppearance = UINavigationBarAppearance()
//    navbarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//    navbarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    navbarAppearance.backgroundColor = UIColor(Color.dayTask)
    UINavigationBar.appearance().standardAppearance = navbarAppearance
    UINavigationBar.appearance().compactAppearance = navbarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navbarAppearance
  }
}
