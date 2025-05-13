//
//  Button.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 12/05/2025.
//

import SwiftUI

struct MsgButton: View {
  var text: String
  var body: some View {
    Button(action: {}) {
      Text(text)
        .fontWeight(.medium)
        .font(.custom("Inter-Regular", size: 18))
    }
  }
}

#Preview {
    MsgButton(text: "Me")
}
