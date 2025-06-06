//
//  OffsetKey.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 06/06/2025.
//

import Foundation
import SwiftUI


struct OffsetKey: PreferenceKey {
  static var defaultValue: CGFloat = 1.0
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}
