//
//  TaskDetail.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 11/05/2025.
//

import SwiftUI

struct TaskDetail: View {
  @Environment(\.dismiss) var dismiss
  var tasks: [[String: Any]] = [["name": "User Interviews", "done": true], ["name": "Wireframes", "done": true], ["name": "Design System", "done": false], ["name": "Icons", "done": false], ["name": "Final Mockups", "done":false]]
  var body: some View {
    ZStack {
      Color.dayTask
        .ignoresSafeArea()
      
      ScrollView {
        VStack(spacing: 30) {
          Text("Real Estate App Design")
            .font(.custom("PilatExtended-Bold", size: 21))
            .fontWithLineHeight(size: 21, weight: 600, lineHeight: 25.5)
            .foregroundStyle(.white)
            .padding(.top, 30)
          
          HStack {
            HStack {
              VStack {
                Image("calendarremove")
              }
              .frame(width: 47, height: 47)
              .background(.dayTaskY)
              
              VStack(spacing: -4) {
                Text("Due Date")
                  .fontWithLineHeight(size: 11, weight: 500, lineHeight: 21.5)
                  .foregroundStyle(.daytaskG)
                
                Text("20 June")
                  .fontWithLineHeight(size: 17, weight: 600, lineHeight: 21.5)
                  .foregroundStyle(.white)
              }
            }
            
            Spacer()
            
            HStack {
              VStack {
                Image("profile2user")
              }
              .frame(width: 47, height: 47)
              .background(.dayTaskY)
              
              VStack(spacing: -3) {
                Text("Project Team")
                  .fontWithLineHeight(size: 11, weight: 500, lineHeight: 21.5)
                  .foregroundStyle(.daytaskG)
                
                HStack(spacing: -5) {
                  Image("member3")
                  Image("member4")
                  Image("member5")
                }
              }
            }
          }
          
          VStack(alignment: .leading) {
            Text("Project Details")
//              .font(.custom("Inter-Regular", size: 18))
              .fontWithLineHeight(size: 18, weight: 500, lineHeight: 21.5)
              .foregroundColor(.white)
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled")
              .font(.custom("Inter-Bold", size: 12))
              .fontWeight(.regular)
              .foregroundStyle(.daytaskG)
          }
          
          HStack {
            Text("Project Progress")
//              .font(.custom("Inter-Bold", size: 18))
//              .fontWithLineHeight(size: 18, weight: 500, lineHeight: 21.5)
              .fontSizeWithWeight(size: 18, weight: 500)
              .foregroundStyle(.white)
            
            Spacer()
            
            CircularProgressView(progress: 60)
              .frame(width: 59, height: 59)
          }
          
          VStack(alignment: .leading, spacing: 30) {
            Text("All Tasks")
              .fontSizeWithWeight(size: 18, weight: 500)
              .foregroundColor(.white)
            
            VStack(spacing: 20) {
              ForEach(tasks.indices, id: \.self) { index in
                Task(name: tasks[index]["name"] as! String, status: tasks[index]["done"] as! Bool)
              }
            }
          }
        }
      }
      .padding()
      .safeAreaInset(edge: .bottom) {
        HStack {
          ButtonView(buttonText: "Add Task")
        }
        .background(.daytaskTab)
        .padding(.top, 0)
        .padding(.bottom, -5)
        .padding(.horizontal, 40)
      }
      .navigationBarBackButtonHidden(true)
//      .navigationTitle("Task Details")
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
        
        
        ToolbarItem(placement: .navigation) {
          Text("Task Details")
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.leading, 70)
          
        }
        
        ToolbarItem(placement: .topBarTrailing) {
          Button(action: {}) {
            Image("edit")
          }
        }
      })
    }
  }
}

struct Task: View {
  var name: String
  var status: Bool
  var body: some View {
    HStack {
      Text(name)
        .font(.system(size: 25))
        .fontWeight(.medium)
        .font(.custom("Inter-Bold", size: 18))
        .foregroundColor(.white)
      
      Spacer()
      
      VStack {
        StatusBox(status: status)
      }
      .frame(width: 40, height: 40)
      .background(.dayTaskY)
    }
    .padding()
    .background(.daytaskfield)
  }
}

struct StatusBox: View {
  @State var status: Bool
  var body: some View {
    Button(action: {
      status.toggle()
    }) {
      Image(systemName: status ? "checkmark.circle" : "circle")
        .font(.system(size: 25))
        .foregroundStyle(.black)
        .tint(.black)
    }
  }
}

#Preview {
  NavigationStack {
    TaskDetail()
  }
}
