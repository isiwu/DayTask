//
//  ChatItemView.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 12/05/2025.
//

import SwiftUI

struct ChatItemView: View {
  var chat: Chat
  var body: some View {
    VStack {
      VStack(alignment: .trailing) {
        if chat.type.rawValue == "text" {
          Text(chat.body)
            .fontWeight(.regular)
            .font(.custom("Inter-Regular", size: 16))
            .foregroundStyle(chat.sender.rawValue == "owner" ? .black : .white)
            .padding(.leading, 10)
            .padding(.trailing, 20)
            .padding(.top, 15)
            .padding(.bottom, chat.sender.rawValue == "user" ? 15 : 0)
        } else {
          Image("mask")
        }
        
        if chat.sender.rawValue == "owner" && chat.seen {
          Text("Seen")
            .fontWeight(.regular)
            .font(.custom("Inter-Regular", size: 10))
            .padding(.top, 8)
            .padding(.trailing, 6)
            .padding(.bottom, 4)
        }
      }
      .background(chat.sender.rawValue == "owner" ? .dayTaskY : .daytaskTab)
    }
    .padding(chat.sender.rawValue == "owner" ? .leading : .trailing, 90)
    .frame(maxWidth: .infinity, alignment: chat.sender.rawValue == "owner" ? .trailing : .leading)
  }
}

#Preview {
  ChatItemView(chat: Chat(type: Chat.MessageType(rawValue: "text")!, sender: Chat.Sender(rawValue: "owner")!, seen: true, body: "Hi, please check the new task."))
}
