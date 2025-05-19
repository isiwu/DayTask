//
//  Splash.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 05/05/2025.
//

import SwiftUI

struct Splash: View {
  @AppStorage(UserKeys.hasSeenSplash.rawValue) var hasSeenSplash = false
  var body: some View {
    ZStack {
      Color.dayTask
        .ignoresSafeArea()
      
      VStack {
        VStack(alignment: .leading, spacing: -2) {
          Image("bro")
          HStack(spacing: -3) {
            Text("Day")
              .foregroundStyle(.white)
            Text("Task")
              .font(.system(size: 16.26))
              .fontWeight(.bold)
              .foregroundStyle(.dayTaskY)
          }
          .font(.custom("Pilat Extended", size: 16.26))
        }
        .padding(.top, 50)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        ZStack {
          Color.white
          
          Image("pana")
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 25)
        
        VStack(alignment: .leading) {
          Text("Manage your Task with")
            .font(.custom("Pilat Extended", size: 40))
            .fontWeight(.semibold)
            .foregroundStyle(.white)
          Text("DayTask")
            .font(.custom("Pilat Extended", size: 40))
            .fontWeight(.semibold)
            .foregroundStyle(.dayTaskY)
        }
//        .padding(.top, 8)
        
        ButtonView(buttonText: "Let's Start", action: letStart)
          .padding(.bottom, 30)
      }
      .padding(.horizontal, 35)
    }
  }
  
  func letStart() {
    hasSeenSplash = true
  }
}

#Preview {
    Splash()
}
