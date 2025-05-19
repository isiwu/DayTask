//
//  SignInFormModel.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 19/05/2025.
//

import Foundation
import Combine

class SignInFormModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  
  init(email: String = "", password: String = "") {
    self.email = email
    self.password = password
  }
}
