//
//  ProfileFormModel.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 16/05/2025.
//

import Foundation
import Combine
import UIKit

class ProfileFormModel: ObservableObject {
  @Published var image = UIImage()
  @Published var fullName = ""
  @Published var email = ""
  @Published var pwd = ""
  @Published var task = ""
  @Published var privacy = ""
  @Published var setting = ""
  
  init(image: UIImage ,fullName: String, email: String, pwd: String, task: String, privacy: String, setting: String) {
    self.image = image
    self.fullName = fullName
    self.email = email
    self.pwd = pwd
    self.task = task
    self.privacy = privacy
    self.setting = setting
  }
}
