//
//  CheckBox.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 06/05/2025.
//

import SwiftUI

struct CheckBoxView: View {
  @Binding var checked: Bool
  var body: some View {
    Image(systemName: checked ? "checkmark.square" : "square")
      .font(.system(size: 30))
      .foregroundColor(checked ? Color(UIColor.dayTaskY) : Color.daytaskG)
      .onTapGesture {
        self.checked.toggle()
      }
  }
}

#Preview {
  CheckBoxView(checked: .constant(true))
}
