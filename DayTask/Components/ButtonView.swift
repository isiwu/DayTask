//
//  ButtonView.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 05/05/2025.
//

import SwiftUI

struct ButtonView: View {
  var buttonText: String
  var body: some View {
    Button(action: {}) {
      Text(buttonText)
        .font(.custom("Inter-Bold", size: 25))
        .foregroundStyle(.black)
        .fontWeight(.bold)
        .padding(.all, 25)
    }
    .frame(maxWidth: .infinity)
    .background(.dayTaskY)
    .clipShape(RoundedRectangle(cornerRadius: 2))
  }
}

#Preview {
    ButtonView(buttonText: "Let's Start")
}
