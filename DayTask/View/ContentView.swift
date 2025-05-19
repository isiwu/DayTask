//
//  ContentView.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 19/05/2025.
//

import SwiftUI

struct ContentView: View {
  @AppStorage(UserKeys.hasSeenSplash.rawValue) var hasSeenSplash = false
  @AppStorage(UserKeys.login.rawValue) var login = false
//  @AppStorage(UserKeys.logout.rawValue) var logout = false
  var body: some View {
    if !hasSeenSplash && !login {
      Splash()
    } else if !login && hasSeenSplash {
      Signin()
    } else {
      MainView()
    }
  }
}

#Preview {
    ContentView()
}
