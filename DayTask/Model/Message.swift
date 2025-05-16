//
//  Message.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 12/05/2025.
//

import Foundation

struct Message: Identifiable, Hashable {
//  var id = UUID()
  var name: String
  var text: String
  var image: String
  
  var id: Int {
    hashValue
  }
}
