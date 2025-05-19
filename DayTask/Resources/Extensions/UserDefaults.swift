//
//  UserDefaults.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 19/05/2025.
//

import Foundation

enum UserKeys: String {
  case login
  case logout
  case hasSeenSplash
}

extension UserDefaults {
  func deleteKey(forKey: String) {
    var dict = self.dictionary(forKey: forKey)
//    var dicts = self.dictionaryRepresentation()
    dict?.removeValue(forKey: forKey)
//    dicts.removeValue(forKey: forKey)
  }
}
