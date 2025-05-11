//
//  RadioBoxView.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 06/05/2025.
//

import SwiftUI

struct RadioBoxView: View {
  @Binding var checked: Bool
      
  var body: some View {
    Button(action: {
      self.checked.toggle()
    }) {
      Image(systemName: checked ? "circle.fill" : "circle")
        .font(.system(size: 30))
        .foregroundColor(checked ? Color(UIColor.dayTaskY) : Color.daytaskG)
    }
    .foregroundColor(Color.white)
  }
}

#Preview {
  RadioBoxView(checked: .constant(false))
}
