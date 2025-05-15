//
//  NotificationModel.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 15/05/2025.
//

import Foundation
struct NotificationModel: Identifiable {
  var id = UUID()
  var name: String
  var image: String
  var comment: String
  var project: String
  var status: Status
  
  enum Status: String {
    case new
    case earlier
  }
}
