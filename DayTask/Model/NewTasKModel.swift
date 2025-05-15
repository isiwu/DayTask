//
//  NewTasKModel.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 15/05/2025.
//

import Foundation

struct NewTasKModel: Identifiable {
  var id = UUID()
  var title: String
  var detail: String
  var teams = [String]()
  var time: String
  var date: String
}
