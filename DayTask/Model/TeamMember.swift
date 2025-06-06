//
//  TeamMember.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 26/05/2025.
//

import Foundation
import SwiftData

@Model
class TeamMember {
//  @Attribute(.unique) let id: String = UUID().uuidString
  var name: String
  @Attribute(.externalStorage) var image: Data?
  var task: Task
  
  init(name: String, image: Data? = nil, task: Task = Task()) {
    self.name = name
    self.image = image
    self.task = task
  }
}
