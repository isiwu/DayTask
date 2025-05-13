//
//  Chat.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 12/05/2025.
//

import Foundation

struct Chat: Identifiable, Hashable {
  var id = UUID()
  var type: MessageType
  var sender: Sender
  var seen: Bool
  var body: String
  
  enum MessageType: String {
    case text
    case image
  }
  
  enum Sender: String {
    case owner
    case user
  }
}
