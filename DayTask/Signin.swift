//
//  SignIn.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 05/05/2025.
//

import SwiftUI

struct Signin: View {
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
              Text("Password")
                .fontSizeWithWeight(size: 18, weight: 400)
                .foregroundStyle(.daytaskG)
              HStack {
                Image("lock1")
                
                if showPass {
                  TextField("password", text: $password)
                    .font(.custom("Inter-Regular", size: 18))
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .padding(.vertical, 20)
                } else {
                  SecureField("Pasword", text: $password)
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
            
            Text("Forgot Password?")
              .fontSizeWithWeight(size: 16, weight: 400)
              .foregroundStyle(.daytaskG)
              .underline(true, pattern: .solid, color: .daytaskG)
              .frame(maxWidth: .infinity, alignment: .trailing)
          }
          
          ButtonView(buttonText: "Log In")
          
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
            
            HStack(spacing: 2) {
              Text("Don’t have an account?")
                .fontSizeWithWeight(size: 14, weight: 400)
                .foregroundStyle(.daytaskG)
              Button(action: {}) {
                Text("Sign Up")
                  .fontSizeWithWeight(size: 14, weight: 400)
                  .foregroundStyle(.dayTaskY)
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

//#Preview {
//    Signin()
//}
