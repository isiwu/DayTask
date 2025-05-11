//
//  Signup.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 06/05/2025.
//

import SwiftUI

struct Signup: View {
  @State private var fName = ""
  @State private var email = ""
  @State private var password = ""
  @State private var showPass = false
  @State private var termAccepted = true
  var body: some View {
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
              TextField("Full name", text: $fName)
                .font(.custom("Inter-Regular", size: 18))
                .foregroundStyle(.white)
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
              TextField("email address", text: $fName)
                .font(.custom("Inter-Regular", size: 18))
                .foregroundStyle(.white)
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
                TextField("password", text: $password)
                  .font(.custom("Inter-Regular", size: 18))
                  .foregroundStyle(.white)
                  .padding(.vertical, 20)
              } else {
                SecureField("password", text: $password)
                  .font(.custom("Inter-Regular", size: 18))
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
            .background(.daytaskfield)
            
            HStack {
              CheckBoxView(checked: $termAccepted)
              Text("I have read & agreed to DayTask Privacy Policy, Terms & Condition")
                .font(.custom("Inter-Regular", size: 14))
                .fontWeight(.regular)
                .foregroundStyle(.daytaskG)
//              Text("Privacy Policy, Terms & Condition")
//                .foregroundStyle(.dayTaskY)
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
            
            HStack(spacing: 2) {
              Text("Already have an account?")
                .font(.custom("Inter-Regular", size: 14))
                .fontWeight(.medium)
                .foregroundStyle(.daytaskG)
              Button(action: {}) {
                Text("Log In")
                  .font(.custom("Inter-Regular", size: 14))
                  .fontWeight(.semibold)
                  .foregroundStyle(.dayTaskY)
              }
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
}

#Preview {
    Signup()
}
