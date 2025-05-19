//
//  SignUpFormModel.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 19/05/2025.
//

import Foundation
import Combine

class SignUpFormModel: ObservableObject {
  @Published var fullname = ""
  @Published var email = ""
  @Published var password = ""
  @Published var termAccepted = false
  
  init(fullname: String = "", email: String = "", password: String = "", termAccepted: Bool = false) {
    self.fullname = fullname
    self.email = email
    self.password = password
    self.termAccepted = termAccepted
  }
}
