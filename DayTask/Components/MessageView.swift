//
//  Message.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 12/05/2025.
//

import SwiftUI

struct MessageView: View {
  var message: Message
  var body: some View {
    HStack {
      HStack(spacing: 15) {
        Image(message.image)
        
        VStack(alignment: .leading) {
          Text(message.name)
            .fontWeight(.semibold)
            .font(.custom("Inter-regular", size: 14))
            .foregroundStyle(.white)
          
          Text(message.text)
            .foregroundStyle(.daytaskG)
            .lineLimit(1)
        }
      }
      
      Spacer()
      
      Text("8 May")
        .padding(.leading)
        .foregroundStyle(.white)
    }
    .background(.dayTask)
  }
}

#Preview {
    MessageView(message: Message(name: "Emma", text: "I am coming to see you soon when i'm done as excepted to have been", image: "msg1"))
}
