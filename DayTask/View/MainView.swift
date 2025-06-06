//
//  MainView.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 18/05/2025.
//

import SwiftUI

struct MainView: View {
//  @State private var selection = 1
//  @State private var oldSelection = 1
  @State private var currentTab: Tabs = .home
  var body: some View {
//    TabView(selection: $selection) {
//      HomeView()
//        .tabItem {
//          Label("Home", image: selection == 1 ? "home2" : "home1")
//        }
//        .toolbarBackground(.visible, for: .tabBar)
//        .toolbarBackground(.daytaskTab, for: .tabBar)
//        .tag(1)
//        .onAppear(perform: {
//          oldSelection = selection
//        })
//      
//      MessagesView()
//        .tabItem {
//          Label("Chat", image: selection == 2 ? "chat2" : "chat1")
//        }
//        .toolbarBackground(.visible, for: .tabBar)
//        .toolbarBackground(.daytaskTab, for: .tabBar)
//        .tag(2)
//        .onAppear(perform: {
//          oldSelection = selection
//        })
//      
//      Text("add")
//        .tabItem {
////          Image("center")
////            .frame(width: 54, height: 54)
//        }
//        .tint(.dayTaskY)
//        .toolbarBackground(.visible, for: .tabBar)
//        .toolbarBackground(.daytaskTab, for: .tabBar)
//        .tag(3)
//        .onAppear(perform: {
//          selection = oldSelection
//        })
//      
//      ScheduleView()
//        .tabItem {
//          Label("Calendar", image: selection == 3 ? "calendar2" : "calendar1")
//        }
//        .toolbarBackground(.visible, for: .tabBar)
//        .toolbarBackground(.daytaskTab, for: .tabBar)
//        .tag(4)
//        .onAppear(perform: {
//          oldSelection = selection
//        })
//      
//      NotificationView()
//        .tabItem {
//          Label("Notification", image: selection == 5 ? "notification2" : "notification1")
//        }
//        .toolbarBackground(.visible, for: .tabBar)
//        .toolbarBackground(.daytaskTab, for: .tabBar)
//        .tag(5)
//        .onAppear(perform: {
//          oldSelection = selection
//        })
//    }
//    .tint(.dayTaskY)
    VStack {
      if currentTab.rawValue == "home" {
        HomeView()
      } else if currentTab.rawValue == "chat" {
        MessagesView()
      } else if currentTab.rawValue == "calendar" {
        ScheduleView()
      } else if currentTab.rawValue == "notification" {
        NotificationView()
      }
    }
    .safeAreaInset(edge: .bottom) {
      TabButtons(currentTab: $currentTab)
    }
  }
}

enum Tabs: String {
  case home
  case chat
  case calendar
  case notification
}

struct TabButtons: View {
  @Binding var currentTab: Tabs
  var body: some View {
    HStack(spacing: 6) {
      Button(action: {
        currentTab = .home
      }) {
        VStack {
          Image(currentTab.rawValue == "home" ? "home2" : "home1")
          Text("Home")
            .foregroundStyle(currentTab.rawValue == "home" ? .dayTaskY : .daytaskG)
            .font(.system(size: 10))
        }
        .padding(.horizontal)
      }
      
      Spacer()
      
      Button(action: {
        currentTab = .chat
      }) {
        VStack {
          Image(currentTab.rawValue == "chat" ? "chat2" : "chat1")
          Text("Chat")
            .foregroundStyle(currentTab.rawValue == "chat" ? .dayTaskY : .daytaskG)
            .font(.system(size: 10))
        }
        .padding(.horizontal)
      }
      
      Spacer()
      
      ZStack {
        Color.dayTaskY
        
        Image(systemName: "plus.app")
          .font(.system(size: 30))
      }
      .frame(width: 50, height: 50)
      
      Spacer()
      
      Button(action: {
        currentTab = .calendar
      }) {
        VStack {
          Image(currentTab.rawValue == "calendar" ? "calendar2" : "calendar1")
          Text("Calendar")
            .foregroundStyle(currentTab.rawValue == "calendar" ? .dayTaskY : .daytaskG)
            .font(.system(size: 10))
        }
      }
      .padding(.horizontal)
      
      Spacer()
      
      Button(action: {
        currentTab = .notification
      }) {
        VStack {
          Image(currentTab.rawValue == "notification" ? "notification2" : "notification1")
          Text("Notification")
            .foregroundStyle(currentTab.rawValue == "notification" ? .dayTaskY : .daytaskG)
            .font(.system(size: 10))
        }
        .padding(.horizontal)
      }
    }
    .padding(.top)
    .background(.daytaskTab)
  }
}

#Preview {
    MainView()
    .modelContainer(previewContainer)
}
