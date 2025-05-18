//
//  ProfileView.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 16/05/2025.
//

import SwiftUI

struct ProfileView: View {
  @ObservedObject var profileModel: ProfileFormModel
  
  var body: some View {
    ZStack {
      Color.dayTask
        .ignoresSafeArea()
       
      VStack {
        ZStack {
          Image("notif2")
            .resizable()
            .scaledToFit()
            .frame(width: 140, height: 140)
            .clipShape(Circle())
            .padding(.all, 8)
            .overlay(content: {
              Circle()
                .stroke(.dayTaskY, lineWidth: 5)
          })
          
          Button(action: {}) {
            Image(systemName: "plus.app")
              .foregroundStyle(.white)
              .font(.system(size: 30))
              .padding(.all, 8)
              .background(.black)
              .clipShape(Circle())
          }
          .offset(x: 40 ,y: 60)
        }
        .padding(.bottom, 20)
        
        ScrollView {
          VStack {
            VStack(spacing: 15) {
              FormTextField(leftIcon: "useradd", prompt: "Fazil Laghari", rightIcon: "edit1", value: $profileModel.fullName)
              
              FormTextField(leftIcon: "usertag1", prompt: "fazzzil72@gmail.com", rightIcon: "edit1", value: $profileModel.email)
              
              FormSecureField(leftIcon: "lock1", prompt: "password", rightIcon: "edit1", value: $profileModel.pwd)
              FormSelectField(
                leftIcon: "task",
                prompt: "My Tasks",
                options: [
                  "Cashew",
                  "Vegetable",
                  "Oil",
                  "Groundnut"
                ],
                value: $profileModel.task
              )
              
              FormSelectField(
                leftIcon: "securitycard",
                prompt: "Privacy",
                options: [
                  "Cashew",
                  "Vegetable",
                  "Oil",
                  "Groundnut"
                ],
                value: $profileModel.privacy
              )
              FormSelectField(
                leftIcon: "setting2",
                prompt: "Setting",
                options: [
                  "Cashew",
                  "Vegetable",
                  "Oil",
                  "Groundnut"
                ],
                value: $profileModel.setting
              )
            }
            .padding(.bottom, 50)
            
            Button(action: {
              
            }) {
              HStack {
                Image("logoutcurve")
                
                Text("Logout")
                  .font(.custom("Inter-Bold", size: 25))
                  .fontWeight(.semibold)
                  .foregroundStyle(.black)
              }
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.dayTaskY)
          }
        }
      }
      .padding(.horizontal)
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden(true)
      .toolbar(content: {
        ToolbarItem(placement: .topBarLeading) {
          Button(action: {}) {
            Image(systemName: "arrow.backward")
              .foregroundStyle(.white)
              .font(.system(size: 24))
          }
        }
        
        ToolbarItem(placement: .principal) {
          Text("Profile")
            .font(.title)
            .foregroundStyle(.white)
        }
      })
    }
  }
  
  init() {
    let viewModel = ProfileFormModel()
    viewModel.image = UIImage(named: "notif2")!
    profileModel = viewModel
  }
}


private struct FormTextField: View {
  var leftIcon: String
  var prompt: String
  var rightIcon: String
  @Binding var value: String
  
  var body: some View {
    HStack {
      Image(leftIcon)
      
      TextField(prompt, text: $value, prompt: Text(prompt).foregroundStyle(.white))
        .foregroundStyle(.white)
        .font(.system(size: 25))
        .fontWeight(.regular)
        .padding(.vertical, 2)
        .padding(.horizontal, 10)
      
      Image(rightIcon)
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(.daytaskfield)
  }
}

private struct FormSecureField: View {
  var leftIcon: String
  var prompt: String
  var rightIcon: String
  @Binding var value: String
  
  var body: some View {
    HStack {
      Image(leftIcon)
      
      SecureField(prompt, text: $value, prompt: Text(prompt).foregroundStyle(.white))
        .foregroundStyle(.white)
        .font(.system(size: 25))
        .fontWeight(.regular)
        .padding(.vertical, 2)
        .padding(.horizontal, 10)
      
      Image(rightIcon)
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(.daytaskfield)
  }
}

private struct FormSelectField: View {
  var leftIcon: String
  var prompt: String
  var options: [String]
  
  @State private var selection = ""
  @State private var isExpanded = false
  @Binding var value: String
  
  var body: some View {
    VStack {
      HStack {
        Image(leftIcon)
        Text(prompt)
          .foregroundStyle(.white)
          .font(.system(size: 25))
          .fontWeight(.regular)
          .padding(.horizontal, 10)
        
        Spacer()
        
        Image(systemName: "chevron.down")
          .font(.system(size: 25))
          .font(.subheadline)
          .foregroundStyle(.gray)
          .rotationEffect(.degrees(isExpanded ? 180 : 0))
      }
      .background(.daytaskfield)
      .padding(.horizontal)
      .onTapGesture {
        withAnimation(.snappy) {
          isExpanded.toggle()
        }
      }
      
      if isExpanded {
        VStack {
          ForEach(options, id: \.self) { option in
            Divider()
              .background(.white)
            HStack {
              Text(option)
                .foregroundStyle(.white)
                .font(.system(size: 25))
                .fontWeight(.regular)
                .padding(.vertical, 2)
                .padding(.horizontal, 10)
              
              Spacer()
              
              if selection == option {
                Image(systemName: "checkmark")
                  .font(.system(size: 30))
                  .font(.subheadline)
                  .foregroundStyle(.dayTaskY)
              }
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            .onTapGesture {
              withAnimation(.snappy) {
                selection = option
                isExpanded.toggle()
              }
            }
          }
        }
        .transition(.move(edge: .bottom))
      }
    }
    .padding(.vertical, 20)
    .background(.daytaskfield)
  }
}

#Preview {
  NavigationStack {
//    ProfileView(profileModel: ProfileFormModel(image: UIImage(), fullName: "", email: "", pwd: "", task: "", privacy: "", setting: ""))
    ProfileView()
  }
}
