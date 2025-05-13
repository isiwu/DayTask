//
//  TaskForDay.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 13/05/2025.
//

import Foundation

struct TaskForDay: Identifiable {
  var id = UUID()
  var name: String
  var time: String
  var members = [String]()
}
