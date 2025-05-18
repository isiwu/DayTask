//
//  ChatView.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 12/05/2025.
//

import SwiftUI

struct ChatView: View {
  @Environment(\.dismiss) var dismiss
  @State private var chat = ""
  var person = ChatPerson(name: "Olivia Anna", image: "msg1")
  var chats = [
    Chat(type: .text, sender: .user, seen: true, body: "Hi, please check the new task."),
    Chat(type: .text, sender: .owner, seen: true, body: "Hi, please check the new task. And me"),
    Chat(type: .text, sender: .user, seen: true, body: "Got it. Thanks."),
    Chat(type: .text, sender: .user, seen: true, body: "Hi, please check the last task, that I have completed."),
    Chat(type: .image, sender: .user, seen: true, body: "mask"),
    Chat(type: .text, sender: .owner, seen: true, body: "Got it. Will check it soon."),
    Chat(type: .text, sender: .user, seen: true, body: "Hi, please check the new task."),
    Chat(type: .text, sender: .owner, seen: true, body: "Got it. Will check it soon.")
  ]
  var body: some View {
    ZStack {
      Color.dayTask
        .ignoresSafeArea()
      
      ScrollViewReader { proxy in
        ScrollView {
          VStack {
            ForEach(chats.indices, id: \.self) { index in
              ChatItemView(chat: chats[index])
                .id(chats[index])
                .padding(.top, index != 0 && chats[index].sender.rawValue != chats[index - 1].sender.rawValue ? 40 : 0)
            }
          }
        }
        .onAppear(perform: {
          proxy.scrollTo(chats.last)
        })
      }
      .padding()
      .navigationBarBackButtonHidden(true)
      .navigationBarTitleDisplayMode(.inline)
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
          HStack {
            Image(person.image)
            
            VStack(alignment: .leading) {
              Text(person.name)
                .fontWeight(.semibold)
                .font(.custom("Inter-regular", size: 14))
                .foregroundStyle(.white)
              
              Text("Online")
                .foregroundStyle(.daytaskG)
            }
          }
        }
        
        ToolbarItem(placement: .topBarTrailing) {
          HStack(spacing: 15) {
            Image(systemName: "video")
            Image(systemName: "phone.badge.waveform")
          }
          .foregroundStyle(.white)
        }
        
        ToolbarItem(placement: .bottomBar) {
          HStack {
            HStack {
              Image("elementequal")
              
              TextField("", text: $chat, prompt: Text("Type a message").foregroundStyle(.daytaskG))
//                .padding(.vertical, 2)
              
              Button(action: {}) {
                Image(systemName: "paperplane")
                  .rotationEffect(.degrees(45))
                  .foregroundStyle(.dayTaskY)
              }
            }
            .padding()
            .background(.daytaskTab)
            
            Spacer()
            
            Button(action: {}) {
              Image("microphone2")
            }
            .foregroundStyle(.dayTaskY)
            .padding()
            .background(.daytaskTab)
          }
        }
    })
    }
  }
}

#Preview {
  NavigationStack {
    ChatView(person: ChatPerson(name: "Olivia Anna", image: "msg1"))
  }
}
