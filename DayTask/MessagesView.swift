//
//  MessagesView.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 12/05/2025.
//

import SwiftUI

struct MessagesView: View {
  var messages = [
    Message(name: "Olivia Anna", text: "Hi, please check the last task, that I....", image: "msg1"),
    Message(name: "Emna", text: "Hi, please check the last task, that I....", image: "msg2"),
    Message(name: "Robert Brown", text: "Hi, please check the last task, that I....", image: "msg3"),
    Message(name: "James", text: "Hi, please check the last task, that I....", image: "msg4"),
    Message(name: "Sophia", text: "Hi, please check the last task, that I....", image: "msg5"),
    Message(name: "Isabella", text: "Hi, please check the last task, that I....", image: "msg6")
  ]
  @Environment(\.dismiss) var dismiss
  var body: some View {
    ZStack {
      Color.dayTask
        .ignoresSafeArea()
      
    VStack(spacing: 40) {
      HStack {
        MsgButton(text: "Chat")
          .frame(width: 170, height: 50)
          .foregroundStyle(.black)
          .background(.dayTaskY)
        Spacer()
        MsgButton(text: "Groups")
          .frame(width: 170, height: 53)
          .foregroundStyle(.white)
          .background(.daytaskTab)
      }
          
      ScrollView {
        VStack(spacing: 40) {
          ForEach(messages, id: \.image) { message in
            MessageView(message: message)
          }
        }
      }
     }
     .padding()
     .navigationTitle("Messages")
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
       
       ToolbarItem(placement: .topBarTrailing) {
         Button(action: {}) {
           Button(action: {}) {
             Image("edit")
           }
         }
       }
     })
    }
  }
}

#Preview {
  NavigationStack {
    MessagesView()
  }
}
