//
//  FontFamily.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 08/05/2025.
//

import SwiftUI

struct FontFamily: ViewModifier {
  let fontFamily: String
  let size: CGFloat
  func body(content: Content) -> some View {
    content
      .font(Font(UIFont(name: fontFamily, size: size)!))
  }
}

extension View {
  func fontFamily(fontFamily: String, size: CGFloat) -> some View {
    self.modifier(FontFamily(fontFamily: fontFamily, size: size))
  }
}
