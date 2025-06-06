//
//  ButtonView.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 05/05/2025.
//

import SwiftUI

struct ButtonView: View {
  var buttonText: String
  var action: (() -> Void)?
//  @Environment(NewTaskViewModel.self) var model
  var isLoading: Bool = false
  var body: some View {
    Button(action: {
      self.action?()
    }) {
      if isLoading {
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle(tint: .blue))
          .scaleEffect(3.0, anchor: .center)
          .padding(.all, 4)
      } else {
        Text(buttonText)
          .font(.custom("Inter-Bold", size: 25))
          .foregroundStyle(.black)
          .fontWeight(.bold)
      }
    }
    .padding(.all, 25)
    .frame(maxWidth: .infinity)
    .background(.dayTaskY)
    .clipShape(RoundedRectangle(cornerRadius: 2))
  }
  
  enum Models {
    case NewTaskViewModel
  }
}

#Preview {
  ButtonView(buttonText: "Let's Start")
//    .environment(NewTaskViewModel())
}
