//
//  FontWeight.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 06/05/2025.
//

//import UIKit
import SwiftUI

struct FontSizeWithWeight: ViewModifier {
  var size: CGFloat
  var weight: CGFloat
  func body(content: Content) -> some View {
    content
      .font(Font(UIFont.systemFont(ofSize: size, weight: UIFont.Weight(weight))))
  }
}

extension View {
  func fontSizeWithWeight(size:CGFloat ,weight: CGFloat) -> some View {
    self.modifier(FontSizeWithWeight(size: size ,weight: weight))
  }
}
