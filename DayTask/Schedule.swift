//
//  Schedule.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 13/05/2025.
//

import SwiftUI

struct Schedule: View {
  var wkdays = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"]
  var tasksForDay = [
//    TaskForDay(name: "User Interviews", time: "16:00 - 18:30", members: ["member1", "member2", "member3"]),
    TaskForDay(name: "Wireframe", time: "16:00 - 18:30", members: ["member1", "member2", "member3"]),
    TaskForDay(name: "Icons", time: "16:00 - 18:30", members: ["member1"]),
    TaskForDay(name: "Mockups", time: "16:00 - 18:30", members: ["member2", "member3"]),
    TaskForDay(name: "Testing", time: "16:00 - 18:30", members: ["member3", "member5"]),
    TaskForDay(name: "Wireframe", time: "16:00 - 18:30", members: ["member2", "member3"]),
    TaskForDay(name: "Testing", time: "16:00 - 18:30", members: ["member5", "member3"]),
    TaskForDay(name: "Wireframe", time: "16:00 - 18:30", members: ["member3"])
  ]
  var body: some View {
    ZStack {
      Color.dayTask
        .ignoresSafeArea()
      
      VStack(spacing: 40) {
        VStack(alignment: .leading) {
          Text("November")
            .foregroundStyle(.white)
            .font(.custom("Inter-Bold", size: 25))
            .fontWeight(.semibold)
          
          ScrollView(.horizontal) {
            HStack(spacing: 10) {
              ForEach(wkdays.indices, id: \.self) { index in
                VStack {
                  Text("\(index + 1)")
                    .fontWeight(.semibold)
                    .font(.system(size: 18.82))
                  Text(wkdays[index])
                    .fontWeight(.medium)
                    .font(.system(size: 9.41))
                }
                .foregroundStyle(index == 3 ? .black : .white)
                .padding()
                .frame(width: 55)
                .background(index == 3 ? .dayTaskY : .daytaskTab)
              }
            }
          }
          .scrollIndicators(.hidden)
        }
        
        VStack(alignment: .leading, spacing: 25) {
          Text("Today’s Tasks")
            .fontWeight(.semibold)
            .font(.system(size: 20))
            .foregroundStyle(.white)
          
          ScrollView {
            VStack {
              HStack {
                VStack(alignment: .leading) {
                  Text("User Interviews")
                    .fontWeight(.medium)
                    .font(.custom("Inter-Bold", size: 18))
                  
                  Text("16:00 - 18:30")
                    .fontWeight(.regular)
                    .font(.custom("Inter-Bold", size: 12))
                }
                
                Spacer()
                
                HStack(spacing: -5) {
                  Image("member1")
                    .overlay(content: {
                      RoundedRectangle(cornerRadius: 25)
                        .stroke(style: StrokeStyle())
                    })
                  Image("member2")
                    .overlay(content: {
                      RoundedRectangle(cornerRadius: 25)
                        .stroke(style: StrokeStyle())
                    })
                  Image("member3")
                    .overlay(content: {
                      RoundedRectangle(cornerRadius: 25)
                        .stroke(style: StrokeStyle())
                    })
                }
              }
              .padding()
              .frame(maxWidth: .infinity)
              .background(.dayTaskY)
              
              ForEach(tasksForDay) { task in
                ZStack {
                  Rectangle()
                    .fill(.dayTaskY)
                  
                  Rectangle()
                    .fill(.daytaskTab)
                    .padding(.leading, 10)
                  
                  TaskForTheDay(task: task)
                    .padding()
                    .padding(.leading, 30)
                }
              }
            }
          }
        }
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
      .navigationTitle("Schedule")
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
        
        ToolbarItem {
          Button(action: {}) {
            Image(systemName: "plus.app")
              .foregroundStyle(.white)
              .font(.system(size: 24))
          }
        }
      })
    }
  }
}

#Preview {
  NavigationStack {
    Schedule()
  }
}
