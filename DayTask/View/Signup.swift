//
//  Signup.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 06/05/2025.
//

import SwiftUI

struct Signup: View {
  @State private var showPass = false
  @Environment(\.dismiss) var dismiss
  @ObservedObject var signupFormModel: SignUpFormModel
  @AppStorage(UserKeys.login.rawValue) var login = false
  var body: some View {
    NavigationStack {
      ZStack {
        Color.dayTask
          .ignoresSafeArea()
        
        ScrollView {
          Logo()
            .padding(.top)
          
          Text("Create your account")
            .fontSizeWithWeight(size: 26, weight: 600)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 25)
            .padding(.bottom)
          
          VStack(spacing: 30) {
            VStack(alignment: .leading) {
              Text("Full Name")
                .fontSizeWithWeight(size: 18, weight: 400)
                .font(.custom("Inter-Regular", size: 18))
                .foregroundStyle(.daytaskG)
              
              HStack {
                Image(systemName: "person")
                  .foregroundStyle(.white)
                  .font(.title)
                TextField("", text: $signupFormModel.fullname, prompt: Text("Full name").foregroundStyle(.white))
                  .font(.custom("Inter-Regular", size: 18))
                  .foregroundStyle(.white)
                  .tint(.dayTaskY)
                  .padding(.vertical, 20)
              }
              .padding(.horizontal)
              .background(.daytaskfield)
            }
            
            VStack(alignment: .leading) {
              Text("Email Address")
                .fontSizeWithWeight(size: 18, weight: 400)
                .font(.custom("Inter-Regular", size: 18))
                .foregroundStyle(.daytaskG)
              
              HStack {
                Image("usertag")
                  .foregroundStyle(.white)
                  .font(.title)
                TextField("", text: $signupFormModel.email, prompt: Text("email address").foregroundStyle(.white))
                  .font(.custom("Inter-Regular", size: 18))
                  .foregroundStyle(.white)
                  .tint(.dayTaskY)
                  .padding(.vertical, 20)
              }
              .padding(.horizontal)
              .background(.daytaskfield)
            }
            
            VStack(alignment: .leading) {
              Text("Password")
                .fontSizeWithWeight(size: 18, weight: 400)
                .foregroundStyle(.daytaskG)
              
              HStack {
                Image("lock1")
                
                if showPass {
                  TextField("", text: $signupFormModel.password, prompt: Text("password").foregroundStyle(.white))
                    .font(.custom("Inter-Regular", size: 18))
                    .foregroundStyle(.white)
                    .tint(.dayTaskY)
                    .padding(.vertical, 20)
                } else {
                  SecureField("", text: $signupFormModel.password, prompt: Text("password").foregroundStyle(.white))
                    .font(.custom("Inter-Regular", size: 18))
                    .foregroundStyle(.white)
                    .tint(.dayTaskY)
                    .padding(.vertical, 20)
                }
                
                Button(action: {
                  showPass.toggle()
                }) {
                  if showPass {
                    Image(systemName: "eye")
                  } else {
                    Image(systemName: "eye.slash")
                  }
                }
                .foregroundStyle(.white)
                .font(.title)
              }
              .padding(.horizontal)
              .background(.daytaskfield)
              
              HStack {
                CheckBoxView(checked: $signupFormModel.termAccepted)
                Text("I have read & agreed to DayTask \(Text("Privacy Policy, Terms & Condition").foregroundStyle(.dayTaskY))")
                  .font(.custom("Inter-Regular", size: 14))
                  .fontWeight(.regular)
                  .foregroundStyle(.daytaskG)
                  .onTapGesture(perform: {
                    signupFormModel.termAccepted.toggle()
                  })
              }
              .padding(.top, 15)
            }
          }
          
          VStack(spacing: 20) {
            ButtonView(buttonText: "Sign Up")
            
            HStack {
              VStack{
                Divider()
                  .frame(height: 1)
                  .background(Color.daytaskG)
              }
              Text("Or continue with")
                .font(.custom("Inter-Regular", size: 16))
                .fontWeight(.medium)
                .foregroundStyle(.daytaskG)
                .frame(width: 160)
              VStack {
                Divider()
                  .frame(height: 1)
                  .background(Color.daytaskG)
              }
            }
            
            VStack {
              Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                HStack {
                  Image("google")
                  Text("Google")
                }
                .foregroundStyle(.white)
              }
              .frame(maxWidth: .infinity)
              .padding(.vertical)
              .overlay() {
                Rectangle()
                  .stroke(.white, lineWidth: 2)
              }
              
              HStack(spacing: 8) {
                Text("Already have an account?")
                  .font(.custom("Inter-Regular", size: 20))
                  .fontWeight(.medium)
                  .foregroundStyle(.daytaskG)
                
                Text("Log In")
                  .font(.custom("Inter-Regular", size: 20))
                  .fontWeight(.semibold)
                  .foregroundStyle(.dayTaskY)
                  .onTapGesture(perform: {
                    dismiss()
                  })
              }
              .frame(maxWidth: .infinity)
              .padding(.top, 10)
            }
          }
          .padding(.top, 25)
        }
        .padding(.horizontal)
      }
    }
    .navigationBarBackButtonHidden(true)
    .toolbar(content: {
      ToolbarItem(placement: .topBarLeading) {
        HStack {
          Image(systemName: "chevron.backward")
          Text("Back")
        }
        .foregroundStyle(.white)
        .onTapGesture(perform: {
          dismiss()
        })
      }
    })
  }
  
  init() {
    let formModel = SignUpFormModel()
    signupFormModel = formModel
  }
  
  func loginAction() {
    login = true
  }
}

#Preview {
    Signup()
}
