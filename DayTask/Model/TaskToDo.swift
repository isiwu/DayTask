//
//  TaskToDo.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 26/05/2025.
//

import Foundation
import SwiftData

@Model
final class TaskToDo {
  var name: String
  var task: Task
  
  private var taskStatusRaw: TaskStatus.RawValue = TaskStatus.notDone.rawValue
  var status: TaskStatus {
    get { .init(rawValue: taskStatusRaw) ?? .notDone }
    set { taskStatusRaw = newValue.rawValue }
  }
  
  init(name: String = "", task: Task = Task()) {
    self.name = name
    self.task = task
//    self.taskStatusRaw = taskStatusRaw.rawValue
  }
}

extension TaskToDo {
  enum TaskStatus: String, CaseIterable, Codable {
    case done = "done"
    case notDone = "notDone"
  }
}
