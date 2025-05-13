//
//  TaskForDay.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 13/05/2025.
//

import SwiftUI

struct TaskForTheDay: View {
  var task: TaskForDay
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 10) {
        Text(task.name)
          .fontWeight(.medium)
          .font(.custom("Inter-Bold", size: 18))
          .foregroundStyle(.white)
        
        Text(task.time)
          .fontWeight(.regular)
          .font(.custom("Inter-Bold", size: 12))
          .foregroundStyle(.white)
      }
      
      Spacer()
      
      HStack(spacing: -5) {
        ForEach(task.members.indices, id: \.self) { index in
          Image(task.members[index])
            .overlay(content: {
              RoundedRectangle(cornerRadius: 25)
                .stroke(style: StrokeStyle())
            })
        }
      }
    }
  }
}

#Preview {
    TaskForTheDay(task: TaskForDay(name: "Wireframe", time: "16:00 - 18:30", members: ["member3"]))
    .background(.dayTask)
}
