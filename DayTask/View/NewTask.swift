//
//  NewTask.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 15/05/2025.
//

import SwiftUI

struct NewTask: View {
  @State private var value = ""
  @State private var valueEditor = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
  @Environment(\.dismiss) var dismiss
  var body: some View {
    NavigationStack {
      ZStack {
        Color.dayTask
          .ignoresSafeArea()
        
        VStack {
          VStack(spacing: 30) {
            FormTextField(label: "Task Title", placeholder: "Hi-Fi Wireframe", value: $value)
            
            FormTextEditor(label: "Task Details", value: $valueEditor)
            
            VStack(alignment: .leading) {
              Text("Add team members")
                .fontWeight(.semibold)
                .font(.custom("Inter-Bold", size: 25))
                .foregroundStyle(.white)
              
              HStack {
                ScrollView(.horizontal) {
                  HStack {
                    TeamMember(image: "member", name: "Robert")
                    TeamMember(image: "member0", name: "Robert")
                  }
                }
                .scrollIndicators(.hidden, axes: .horizontal)
                
                Image(systemName: "plus.app")
                  .font(.system(size: 28))
                  .padding()
                  .background(.dayTaskY)
              }
            }
            
            VStack(alignment: .leading) {
              Text("Time & Date")
                .fontWeight(.black)
                .font(.custom("Inter-Bold", size: 25))
                .foregroundStyle(.white)
              
              HStack {
                TimeView(image: "clock", content: "10:30 AM")
                TimeView(image: "calendar", content: "15/11/2022")
              }
            }
          }
          
          Spacer()
          
          ButtonView(buttonText: "Create")
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
          ToolbarItem(placement: .topBarLeading) {
            Button(action: {
              dismiss()
            }) {
              Image(systemName: "arrow.backward")
                .foregroundStyle(.white)
                .font(.system(size: 24))
            }
          }
          
          ToolbarItem(placement: .principal) {
            Text("Create New Task")
              .foregroundStyle(.white)
              .font(.system(size: 24))
          }
        })
      }
    }
  }
}

private struct FormTextField: View {
  var label: String
  var placeholder: String
  @Binding var value: String
  var body: some View {
    VStack(alignment: .leading) {
      Text(label.capitalized)
        .fontWeight(.semibold)
        .font(.custom("Inter-Bold", size: 25))
        .foregroundStyle(.white)
      
      TextField("", text: $value, prompt: Text(placeholder).foregroundStyle(.white))
        .foregroundStyle(.white)
        .font(.system(size: 20))
        .fontWeight(.regular)
        .padding(.vertical)
        .padding(.horizontal, 20)
        .background(.daytaskfield)
    }
  }
}

private struct FormTextEditor: View {
  var label: String
//  var placeholder: String
  @Binding var value : String
  var body: some View {
    VStack(alignment: .leading) {
      Text(label.capitalized)
        .fontWeight(.semibold)
        .font(.custom("Inter-Bold", size: 25))
        .foregroundStyle(.white)
      
      TextEditor(text: $value)
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .foregroundStyle(.white)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .scrollContentBackground(.hidden)
        .background(.daytaskfield)
    }
  }
}

private struct TeamMember: View {
  var image: String
  var name: String
  var body: some View {
    HStack {
      HStack {
        Image(image)
          .resizable()
          .scaledToFit()
          .frame(width: 30, height: 30)
          .clipShape(Circle())
        Text(name)
      }
      .padding(.trailing, 50)
      Image(systemName: "xmark.square")
    }
    .foregroundStyle(.white)
    .font(.system(size: 24))
    .padding()
    .background(.daytaskfield)
  }
}

struct TimeView: View {
  var image: String
  var content: String
  var body: some View {
    ZStack {
      Color.dayTaskY
      
      Image(systemName: image)
        .font(.system(size: 28))
        .padding(.leading, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
      
      Rectangle()
        .fill(.daytaskfield)
        .padding(.leading, 50)

      Text(content)
        .padding(.leading, 35)
        .padding(.vertical)
        .font(.system(size: 20))
        .foregroundStyle(.white)
    }
    .frame(maxWidth: .infinity, maxHeight: 50)
  }
}

#Preview {
  NewTask()
}
