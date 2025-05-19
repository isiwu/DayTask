//
//  SignIn.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 05/05/2025.
//

import SwiftUI

struct Signin: View {
  @State private var showPass = false
  @AppStorage(UserKeys.login.rawValue) var login = false
  @Environment(\.dismiss) var dismiss
  @ObservedObject var signinFormModel: SignInFormModel
  var body: some View {
    NavigationStack {
      ZStack {
        Color.dayTask
          .ignoresSafeArea()
        
        ScrollView {
          Logo()
            .padding(.top)
          
          Text("Welcome Back!")
            .fontSizeWithWeight(size: 26, weight: 600)
            .foregroundStyle(.white)
            .font(.custom("Inter-Bold", size: 59))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 25)
            .padding(.bottom)
          
          VStack(spacing: 25) {
            VStack {
              VStack(alignment: .leading) {
                Text("Email Address")
                  .fontSizeWithWeight(size: 18, weight: 400)
                  .foregroundStyle(.daytaskG)
                HStack {
                  Image("usertag")
                  TextField("", text: $signinFormModel.email, prompt: Text("fazzzil72@gmail.com").foregroundStyle(.white).font(.system(size: 20)))
                    .font(.custom("Inter-Regular", size: 18))
                    .fontWeight(.light)
                    .padding(.vertical, 20)
                    .foregroundStyle(.white)
                    .tint(.dayTaskY)
                }
                .padding(.horizontal)
                .background(Color(.daytaskfield))
              }
              .padding(.bottom)
              
              VStack(alignment: .leading) {
                Text("Password")
                  .fontSizeWithWeight(size: 18, weight: 400)
                  .foregroundStyle(.daytaskG)
                HStack {
                  Image("lock1")
                  
                  if showPass {
                    TextField("", text: $signinFormModel.password, prompt: Text("Password").foregroundStyle(.white))
                      .font(.custom("Inter-Regular", size: 20))
                      .fontWeight(.light)
                      .foregroundStyle(.white)
                      .padding(.vertical, 20)
                  } else {
                    SecureField("", text: $signinFormModel.password, prompt: Text("Pasword").foregroundStyle(.white))
                      .font(.custom("Inter-Regular", size: 20))
                      .fontWeight(.light)
                      .foregroundStyle(.white)
                      .padding(.vertical, 20)
                      .tint(.dayTaskY)
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
                .background(Color(.daytaskfield))
              }
              
              Text("Forgot Password?")
                .fontSizeWithWeight(size: 16, weight: 400)
                .foregroundStyle(.daytaskG)
                .underline(true, pattern: .solid, color: .daytaskG)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            ButtonView(buttonText: "Log In", action: loginAction)
            
            HStack {
              VStack{
                Divider()
                  .frame(height: 1)
                  .background(Color.daytaskG)
              }
              Text("Or continue with")
                .fontSizeWithWeight(size: 16, weight: 500)
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
              
              HStack(spacing: 4) {
                Text("Don’t have an account?")
                  .fontSizeWithWeight(size: 18, weight: 400)
                  .foregroundStyle(.daytaskG)
                NavigationLink(destination: Signup()) {
                  Text("Sign Up")
                    .fontSizeWithWeight(size: 18, weight: 400)
                    .foregroundStyle(.dayTaskY)
                }
              }
              .frame(maxWidth: .infinity)
              .padding(.top, 6)
            }
          }
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
    let formModel = SignInFormModel()
    self.signinFormModel = formModel
  }
  
  func loginAction() {
    login = true
  }
}

#Preview {
  Signin()
}
