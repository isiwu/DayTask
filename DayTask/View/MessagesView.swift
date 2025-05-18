//
//  MessagesView.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 12/05/2025.
//

import SwiftUI

struct MessagesView: View {
  @State private var current = "chat"
//  @Environment(\.dismiss) var dismiss
  var body: some View {
    NavigationStack {
      ZStack {
        Color.dayTask
          .ignoresSafeArea()
        
      VStack(spacing: 40) {
        HStack {
          MsgButton(text: "Chat", action: chatAction)
            .frame(width: 170, height: 50)
            .foregroundStyle(current == "chat" ? .black : .white)
            .background(current == "chat" ? .dayTaskY : .daytaskTab)
          Spacer()
          MsgButton(text: "Groups", action: groupAction)
            .frame(width: 170, height: 53)
            .foregroundStyle(current == "group" ? .black : .white)
            .background(current == "group" ? .dayTaskY : .daytaskTab)
        }
            
        ScrollView {
          if current == "chat" {
            ChatMsgView()
          } else {
            GroupView()
          }
        }
       }
       .padding()
       .navigationBarTitleDisplayMode(.inline)
       .navigationBarBackButtonHidden(true)
       .toolbar(content: {
//         ToolbarItem(placement: .topBarLeading) {
//           Button(action: {
//             dismiss()
//           }) {
//             Image(systemName: "arrow.backward")
//               .foregroundStyle(.white)
//               .font(.system(size: 24))
//           }
//         }
         
         ToolbarItem(placement: .principal) {
           Text("Messages")
             .foregroundStyle(.white)
             .font(.system(size: 24))
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
  
  func chatAction() {
    current = "chat"
  }
  
  func groupAction() {
    current = "group"
  }
}

private struct ChatMsgView: View {
  var messages = [
    Message(name: "Olivia Anna", text: "Hi, please check the last task, that I....", image: "msg1"),
    Message(name: "Emna", text: "Hi, please check the last task, that I....", image: "msg2"),
    Message(name: "Robert Brown", text: "Hi, please check the last task, that I....", image: "msg3"),
    Message(name: "James", text: "Hi, please check the last task, that I....", image: "msg4"),
    Message(name: "Sophia", text: "Hi, please check the last task, that I....", image: "msg5"),
    Message(name: "Isabella", text: "Hi, please check the last task, that I....", image: "msg6")
  ]
  var body: some View {
    VStack(spacing: 40) {
      ForEach(messages, id: \.image) { message in
        NavigationLink(destination: ChatView()) {
          MessageView(message: message)
        }
      }
    }
  }
}

private struct GroupView: View {
  var groups = [
    Group(name: "Android Developer", logo: "team1", members: ["member1", "member3", "member5"]),
    Group(name: "IOS Developer", logo: "team2", members: ["member2", "member4", "member5"]),
    Group(name: "Web Developer", logo: "team3", members: ["member1", "member3", "member4", "member5"]),
    Group(name: "Back-End Team", logo: "team4", members: ["member1", "member3", "member5"]),
    Group(name: "Front-End Team", logo: "team5", members: ["member1", "member3", "member2", "member5"]),
    Group(name: "Android Developer", logo: "team6", members: ["member1", "member3", "member5"]),
    Group(name: "Personal Project", logo: "team7", members: ["member1", "member3", "member5"]),
    Group(name: "School System Project", logo: "team8", members: ["member1", "member2", "member5", "member3", "member4"]),
    
  ]
  var body: some View {
    VStack(alignment: .leading, spacing: 30) {
      ForEach(groups) { group in
        HStack(spacing: 15) {
          Image(group.logo)
          
          VStack(alignment: .leading) {
            Text(group.name)
              .fontWeight(.semibold)
              .font(.custom("Inter-Bold", size: 24))
              .foregroundStyle(.white)
            
            HStack(spacing: -5) {
              ForEach(group.members.indices, id: \.self) { index in
                Image(group.members[index])
              }
            }
          }
        }
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

#Preview {
  MessagesView()
}
