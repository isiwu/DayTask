//
//  HomeView.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 06/05/2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {
  @State private var search = ""
  var completedTasks: [[String: Any]] = [["task":"Real Estate Website Design", "first":true], ["task":"Finance Mobile App Design", "first": false], ["task": "Wallet Mobile App Design", "first": false]]
  @Query var tasks: [Task]
  
  var body: some View {
    NavigationStack {
      ZStack {
        Color.dayTask
          .ignoresSafeArea()
        
        ScrollView(showsIndicators: false) {
          VStack(spacing: 30) {
            HStack(alignment: .bottom) {
              VStack(alignment: .leading, spacing: -1) {
                Text("Welcome Back!")
                  .fontWeight(.medium)
      //            .font(.custom("Inter-Bold", size: 11.79))
                  .fontWithLineHeight(size: 11.79, weight: 500, lineHeight: 18.86)
                  .foregroundStyle(.dayTaskY)
                
                Text("Fazil Laghari")
                  .fontWeight(.semibold)
                  .font(.custom("PilatExtended-Bold", size: 22.29))
                  .foregroundStyle(.white)
                  
              }
              
              Spacer()
              
              Image("home-user")
            }
            .padding(.top)
            
            HStack {
              HStack {
                Image("search")
                TextField("", text: $search, prompt: Text("Search").foregroundStyle(.white))
                  .foregroundStyle(.white)
                  .tint(.dayTaskY)
              }
              .padding(.vertical)
              .padding(.horizontal)
              .background(.daytaskfield)
              
              Image("setting")
    //            .padding()
                .frame(width: 57)
                .frame(height: 58)
                .background(.dayTaskY)
            }
            
            VStack {
              HStack {
                Text("Completed Tasks")
                  .foregroundStyle(.white)
                  .fontWithLineHeight(size: 20, weight: 600, lineHeight: 27.5)
                
                Spacer()
                
                Text("See all")
                  .foregroundStyle(.dayTaskY)
                  .fontWithLineHeight(size: 16, weight: 400, lineHeight: 27.5)
              }
              
              ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                  ForEach(completedTasks.indices, id: \.self) {index in
                    CompletedTask(task: completedTasks[index]["task"] as! String, first: completedTasks[index]["first"] as! Bool)
                  }
                  .background(.white)
                }
              }
              
            }
            
            VStack {
              HStack {
                Text("Ongoing Projects")
                  .foregroundStyle(.white)
                  .fontWithLineHeight(size: 20, weight: 600, lineHeight: 27.5)
                
                Spacer()
                
                Text("See all")
                  .foregroundStyle(.dayTaskY)
                  .fontWithLineHeight(size: 16, weight: 400, lineHeight: 27.5)
              }
              
              VStack(spacing: 15) {
                ForEach(tasks) {task in
                  NavigationLink(destination: TaskDetail(task: task)) {
                    OngoingProject(task: task)
                  }
                }
              }
              
            }
          }
          .padding(.horizontal)
        }
      }
    }
  }
}

struct CompletedTask: View {
  var task: String
  var first: Bool
  var body: some View {
    VStack {
      Text(task)
        .foregroundStyle(first ? .black : .white)
        .font(.custom("PilatExtended-Bold", size: 21))
        .fontWithLineHeight(size: 21, weight: 600, lineHeight: 25.5)
      
      HStack {
        Text("Team members")
          .foregroundStyle(first ? .black : .white)
          .fontWithLineHeight(size: 11, weight: 400, lineHeight: 16.5)
        
        Spacer()
        
        HStack(spacing: -8) {
          Image("member1")
          Image("member2")
          Image("member3")
          Image("member4")
          Image("member5")
        }
      }
      
      VStack {
        HStack {
          Text("Completed")
            .foregroundStyle(first ? .black : .white)
          Spacer()
          Text("100%")
            .foregroundStyle(first ? .black : .white)
        }
        
        ProgressView(value: 1.0, total: 1)
          .tint(first ? .black : .white)
          .clipShape(RoundedRectangle(cornerRadius: 30))
          .scaleEffect(x: 1, y: 3, anchor: .center)
      }
    }
    .padding()
    .frame(width: 200)
    .background(first ? .dayTaskY : .daytaskfield)
  }
}

struct OngoingProject: View {
  var task: Task
  @State private var taskTotal = 0
  @State private var tasksCompleted = 0
  @Query var tasks: [Task]
  var dateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "d MMMM"
    
    return formatter
  }()
  var body: some View {
    VStack {
      VStack(alignment: .leading) {
        Text(task.title)
          .font(.custom("PilatExtended-Bold", size: 21))
          .fontWithLineHeight(size: 21, weight: 600, lineHeight: 25.5)
          .foregroundStyle(.white)

        Text("Team members")
          .foregroundStyle(.white)
        
       }
      .frame(maxWidth: .infinity, alignment: .leading)
      
      HStack(alignment: .bottom) {
        VStack(alignment: .leading, spacing: 20) {
          HStack(spacing: -5) {
            Image("member4")
            Image("member3")
            Image("member5")
          }
          
          HStack {
            Text("Due on: ")
            Text(dateFormatter.string(from: task.dueDate))
          }
          .foregroundStyle(.white)
        }
        
        Spacer()
        
        CircularProgressView(total: taskTotal != 0 ? taskTotal : 100, progress: tasksCompleted)
          .frame(width: 59, height: 59)
      }
    }
    .padding(.all, 10)
    .background(.daytaskfield)
    .onAppear(perform: {
      if let tasksToDo = task.tasksToDo {
        let tasksCompleted = tasksToDo.filter { $0.status.rawValue == "done" }
        
        self.taskTotal = tasksToDo.count
        self.tasksCompleted = tasksCompleted.count
      }
    })
    .onChange(of: tasks, {
      let task = tasks.first(where: { item in
        item.title == self.task.title
      })
      
      if let tasksToDo = task?.tasksToDo {
        let tasksCompleted = tasksToDo.filter { $0.status.rawValue == "done" }
        
        self.taskTotal = tasksToDo.count
        self.tasksCompleted = tasksCompleted.count
      }
    })
  }
}

#Preview {
    HomeView()
}
