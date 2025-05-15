//
//  Notification.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 15/05/2025.
//

import SwiftUI

struct Notification: View {
  var notification: NotificationModel
  var body: some View {
    HStack(alignment: .top) {
      HStack(alignment: .top) {
        Image(notification.image)
          .resizable()
          .scaledToFit()
          .clipShape(Circle())
          .frame(width: 50, height: 50)
        
        VStack(alignment: .leading) {
          Text("\(Text(notification.name).font(.custom("Inter-Bold", size: 20)).fontWeight(.bold).foregroundStyle(.white)) \(Text(notification.comment).font(.custom("Inter-Bold", size: 16)).fontWeight(.bold).foregroundStyle(.daytaskG))")
          
          Text(notification.project.capitalized)
            .font(.custom("Inter-Bold", size: 18))
            .fontWeight(.bold)
            .foregroundStyle(.dayTaskY)
        }
      }
      
      Text("32 min")
        .foregroundStyle(.white)
        .padding(.leading, 20)
    }
//    .padding(.vertical, 10)
  }
}

#Preview {
  NavigationStack {
    Notification(notification: NotificationModel(name: "Olivia Anna", image: "notif1", comment: "left a comment in task", project: "Mobile App Design Project", status: .new))
      .background(.dayTask)
  }
}
