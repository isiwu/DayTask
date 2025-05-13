//
//  Group.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 13/05/2025.
//

import Foundation

struct Group: Identifiable, Hashable {
  var id = UUID()
  var name: String
  var logo: String
  var members = [String]()
}
