//
//  Notification.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 15/05/2025.
//

import SwiftUI

struct NotificationView: View {
  var notifications = [
    NotificationModel(name: "Olivia Anna ", image: "notif1", comment: "left a comment in task", project: "Mobile App Design Project", status: .new),
    NotificationModel(name: "Robert Brown", image: "notif2", comment: "left a comment in task", project: "Mobile App Design Project", status: .new),
    NotificationModel(name: "Sophia", image: "notif3", comment: "left a comment in task", project: "Mobile App Design Project", status: .new),
    NotificationModel(name: "Anna", image: "notif4", comment: "left a comment in task", project: "Mobile App Design Project", status: .new),
    NotificationModel(name: "Robert Brown", image: "notif5", comment: "left a comment in task", project: "Mobile App Design Project", status: .earlier),
    NotificationModel(name: "Sophia", image: "notif6", comment: "left a comment in task", project: "Mobile App Design Project", status: .earlier),
    NotificationModel(name: "Anna", image: "notif7", comment: "left a comment in task", project: "Mobile App Design Project", status: .earlier)
  ]
  var sections = ["New", "Earlier"]
  @State private var newNotifications = [NotificationModel]()
  @State private var earlierNotifications = [NotificationModel]()
  var body: some View {
    NavigationStack {
      ZStack {
        Color.dayTask
          .ignoresSafeArea()
        
        List {
          ForEach(sections, id: \.self) { section in
            Section(header: Text(section.description.capitalized).font(.system(size: 30)).foregroundStyle(.white)) {
              ForEach(notifications) { notification in
                if notification.status.rawValue.lowercased() == section.description.lowercased() {
                  Notification(notification: notification)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color(.dayTask))
                }
              }
            }
          }
        }
        .listStyle(.plain)
        .listRowSpacing(10)

        .onAppear(perform: {
          newNotifications = getNewNotifications()
          earlierNotifications = getEarlierNotifications()
        })
        
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
//          ToolbarItem(placement: .topBarLeading) {
//            Button(action: {}) {
//              Image(systemName: "arrow.backward")
//                .foregroundStyle(.white)
//                .font(.system(size: 24))
//            }
//          }
          
          ToolbarItem(placement: .principal) {
            Text("Notifications")
              .foregroundStyle(.white)
              .font(.system(size: 24))
          }
        })
      }
    }
  }
  
  func getNewNotifications() -> [NotificationModel] {
    notifications.filter { $0.status.rawValue == "new"}
  }
  
  func getEarlierNotifications() -> [NotificationModel] {
    notifications.filter { $0.status.rawValue == "earlier"}
  }
}

#Preview {
  NotificationView()
}
