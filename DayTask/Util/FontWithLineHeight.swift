//
//  LineHeight.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 06/05/2025.
//

import SwiftUI

struct FontWithLineHeight: ViewModifier {
  var size: CGFloat
  var weight: CGFloat
  let lineHeight: CGFloat

  func body(content: Content) -> some View {
    content
      .font(Font(UIFont.systemFont(ofSize: size, weight: UIFont.Weight(weight))))
      .padding(.vertical, (lineHeight - UIFont.systemFont(ofSize: size, weight: UIFont.Weight(weight)).lineHeight))
      .lineSpacing((lineHeight - UIFont.systemFont(ofSize: size, weight: UIFont.Weight(weight)).lineHeight)/2)
  }
}

extension View {
  func fontWithLineHeight(size: CGFloat, weight: CGFloat, lineHeight: CGFloat) -> some View {
    ModifiedContent(content: self, modifier: FontWithLineHeight(size: size, weight: weight, lineHeight: lineHeight))
  }
}
