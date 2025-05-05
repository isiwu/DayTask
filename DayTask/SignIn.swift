//
//  SignIn.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 05/05/2025.
//

import SwiftUI

struct SignIn: View {
  @State private var email = ""
  @State private var password = ""
  @State private var showPass = false
  var body: some View {
    ZStack {
      Color.dayTask
        .ignoresSafeArea()
      
      ScrollView {
        Logo()
          .padding(.top)
        
        TextWithWeight(text: "Welcome Back!", size: 26, weight: 600, color: UIColor.white)
          .font(.custom("Inter-Bold", size: 59))
          .frame(maxWidth: .infinity, alignment: .leading)
        
        VStack(spacing: 25) {
          VStack {
            VStack(alignment: .leading) {
              TextWithWeight(text: "Email Address", size: 18, weight: 400, color: UIColor.daytaskG)
              HStack {
                Image("usertag")
                TextField("fazzzil72@gmail.com", text: $email)
                  .font(.custom("Inter-Regular", size: 18))
                  .fontWeight(.light)
                  .foregroundStyle(.white)
                  .padding(.vertical, 20)
              }
              .padding(.horizontal)
              .background(Color(.daytaskfield))
            }
            .padding(.bottom)
            
            VStack(alignment: .leading) {
              TextWithWeight(text: "Password", size: 18, weight: 400, color: UIColor.daytaskG)
              HStack {
                Image("lock1")
                
                if showPass {
                  TextField("password", text: $password)
                    .font(.custom("Inter-Regular", size: 18))
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .padding(.vertical, 20)
                } else {
                  SecureField("pasword", text: $password)
                    .font(.custom("Inter-Regular", size: 18))
                    .fontWeight(.light)
                    .foregroundStyle(.white)
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
              .background(Color(.daytaskfield))
            }
            
            TextWithWeight(text: "Forgot Password?", weight: 400, color: UIColor.daytaskG)
              .frame(maxWidth: .infinity, alignment: .trailing)
              .underline(false, pattern: .solid, color: .white)
          }
          
          ButtonView(buttonText: "Log In")
          
          HStack {
            VStack{
              Divider()
                .frame(height: 1)
                .background(Color.daytaskG)
            }
            TextWithWeight(text: "Or continue with", size: 16, weight: 500, color: UIColor.daytaskG)
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
                Image(systemName: "google")
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
            
            HStack(spacing: -8) {
              TextWithWeight(text: "Don’t have an account?", size: 14, weight: 400, color: .daytaskG)
              Button(action: {}) {
                TextWithWeight(text: "Sign Up", size: 14, weight: 400, color: .dayTaskY)
              }
            }
            .frame(maxWidth: .infinity)
          }
        }
      }
      .padding(.horizontal)
    }
  }
}

#Preview {
    SignIn()
}
