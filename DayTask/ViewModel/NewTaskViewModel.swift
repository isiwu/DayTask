//
//  NewTaskViewModel.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 01/06/2025.
//

import Foundation
import SwiftUI

@Observable
class NewTaskViewModel {
  var title: String
  var detail: String
  var teams: [TeamMemberViewModel]
  var time: Date
  var date: Date
  var isSaving: Bool
  
  init(title: String = "", detail: String = "", teams: [TeamMemberViewModel] = [], time: Date = .now, date: Date = .now, isSaving: Bool = false) {
    self.title = title
    self.detail = detail
    self.teams = teams
    self.time = time
    self.date = date
    self.isSaving = isSaving
  }
  
  func saving(isSaving: Bool) {
    self.isSaving = isSaving
  }
  
  func reset() {
    title = ""
    detail = ""
    teams = []
    time = .now
    date = .now
  }
}

struct TeamMemberViewModel: Identifiable {
  var id = UUID().uuidString
  var name: String
  var image: UIImage
}
