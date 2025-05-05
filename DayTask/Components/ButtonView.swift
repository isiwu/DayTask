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
        .foregroundStyle(.black)
        .fontWeight(.bold)
        .font(.custom("Inter-Bold", size: 18))
        .padding(.all, 25)
    }
    .frame(maxWidth: .infinity)
    .background(.dayTaskY)
    .clipShape(RoundedRectangle(cornerRadius: 2))
    .padding(.bottom, 20)
  }
}

#Preview {
    ButtonView(buttonText: "Let's Start")
}
