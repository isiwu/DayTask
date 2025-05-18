//
//  MainView.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 18/05/2025.
//

import SwiftUI

struct MainView: View {
  @State private var home = ""
  @State private var chat = ""
  @State private var calendar = ""
  @State private var notification = ""
  @State private var selection = 1
  var body: some View {
    TabView(selection: $selection) {
      HomeView()
        .tabItem {
          Label("Home", image: selection == 1 ? "home2" : "home1")
            .tint(.white)
        }
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarBackground(.daytaskTab, for: .tabBar)
        .tag(1)
      
      MessagesView()
        .tabItem {
          Label("Chat", image: selection == 2 ? "chat2" : "chat1")
        }
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarBackground(.daytaskTab, for: .tabBar)
        .tag(2)
      
      Text("Add")
        .tabItem {
          Image(systemName: "plus.app")
            .font(.system(size: 50))
            .padding()
            .foregroundStyle(.dayTaskY)
            .tint(.dayTaskY)
            .background(.dayTaskY)
        }
        .tag(3)
      
      ScheduleView()
        .tabItem {
          Label("Calendar", image: selection == 3 ? "calendar2" : "calendar1")
            .tint(.white)
        }
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarBackground(.daytaskTab, for: .tabBar)
        .tag(4)
      
      NotificationView()
        .tabItem {
          Label("Notification", image: selection == 5 ? "notification2" : "notification1")
            .tint(.white)
        }
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarBackground(.daytaskTab, for: .tabBar)
        .tag(5)
    }
    .tint(.dayTaskY)
//    .background(.dayTask)
  }
}

#Preview {
    MainView()
}
