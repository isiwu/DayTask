//
//  Task.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 26/05/2025.
//

import Foundation
import SwiftData

@Model
class Task {
//  @Attribute(.unique) var title: String
  var title: String
  var detail: String
  var dueDate: Date
  @Relationship(deleteRule: .cascade, inverse: \TeamMember.task) var teamMembers: [TeamMember]? = []
  @Relationship(deleteRule: .cascade, inverse: \TaskToDo.task) var tasksToDo: [TaskToDo]? = []
  
  init(title: String = "", detail: String = "", dueDate: Date = .now) {
    self.title = title
    self.detail = detail
    self.dueDate = dueDate
  }
}
