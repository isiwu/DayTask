//
//  Logo.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 05/05/2025.
//

import SwiftUI

struct Logo: View {
  var body: some View {
    VStack(alignment: .center, spacing: -2) {
      Image("bro1")
      HStack(spacing: -3) {
        Text("Day")
          .foregroundStyle(.white)
        Text("Task")
          .foregroundStyle(.dayTaskY)
      }
      .font(.custom("Pilat Extended", size: 24.3))
      .fontWeight(Font.Weight.semibold)
      .fontWidth(Font.Width(600))
    }
  }
}

#Preview {
    Logo()
}
