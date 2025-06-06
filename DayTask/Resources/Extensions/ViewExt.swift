//
//  ViewExt.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 06/06/2025.
//

import Foundation
import SwiftUI


extension View {
  func isSameDate(_ date1: Date, _ date2: Date) -> Bool {
    Calendar.current.isDate(date1, inSameDayAs: date2)
  }
}
