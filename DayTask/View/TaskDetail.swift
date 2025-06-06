//
//  TaskDetail.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 11/05/2025.
//

import SwiftUI
//import SwiftData

struct TaskDetail: View {
  var task: Task = Task()
  @State private var addTask = false
//  @Query private var tasksToDo: [TaskToDo]
  @State private var tasks = [TaskToDo]()
  @State private var taskTotal: Int = 0
  @State private var tasksCompleted: Int = 0
  @Environment(\.dismiss) var dismiss
  @Environment(\.modelContext) var modelContext
  var dateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "d MMMM"
    
    return formatter
  }()
  var body: some View {
    ZStack {
      Color.dayTask
        .ignoresSafeArea()
      
      ScrollView {
        VStack(spacing: 30) {
          Text(task.title)
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
                
                Text(dateFormatter.string(from: task.dueDate))
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
              .fontWithLineHeight(size: 18, weight: 500, lineHeight: 21.5)
              .foregroundColor(.white)
            
            Text(task.detail)
              .font(.custom("Inter-Bold", size: 12))
              .fontWeight(.regular)
              .foregroundStyle(.daytaskG)
          }
          
          HStack {
            Text("Project Progress")
              .fontSizeWithWeight(size: 18, weight: 500)
              .foregroundStyle(.white)
            
            Spacer()
            
            CircularProgressView(total: taskTotal != 0 ? taskTotal : 100, progress: tasksCompleted)
              .frame(width: 60, height: 60)
              .padding(.trailing, 2)
          }
          
          VStack(alignment: .leading, spacing: 30) {
            Text("All Tasks")
              .fontSizeWithWeight(size: 18, weight: 500)
              .foregroundColor(.white)
            
            LazyVStack(spacing: 20) {
              if let tasksToDo = task.tasksToDo {
                ForEach(tasksToDo) { taskToDo in
                  TaskView(taskToDo: taskToDo, tasksCompleted: $tasksCompleted)
                }
              }
//              ForEach(tasks) { taskToDo in
//                TaskView(taskToDo: taskToDo)
//              }
            }
          }
        }
        .sheet(isPresented: $addTask) {
          AddTaskViewModal(task: task)
            .presentationDetents([.height(400)])
            .presentationDragIndicator(.automatic)
        }
      }
      .onAppear(perform: {
        if let tasksToDo = task.tasksToDo {
          let tasks = tasksToDo.filter { $0.task.title == task.title }
          let tasksCompleted = tasks.filter { $0.status.rawValue == "done"}
          
          self.tasks = tasks
          self.taskTotal = tasks.count
          self.tasksCompleted = tasksCompleted.count
        }
      })
      .onChange(of: (task.tasksToDo)!) {
        if let tasksToDo = task.tasksToDo {
          let tasks = tasksToDo.filter { $0.task.title == task.title }
          let tasksCompleted = tasks.filter { $0.status.rawValue == "done"}
          
          self.tasks = tasks
          self.taskTotal = tasks.count
          self.tasksCompleted = tasksCompleted.count
        }
      }
      .padding()
      .safeAreaInset(edge: .bottom) {
        HStack {
          ButtonView(buttonText: "Add Task", action: {
            addTask.toggle()
//            deleteTaskToDo()
          })
        }
        .background(.daytaskTab)
        .padding(.top, 0)
        .padding(.bottom, 40)
        .padding(.horizontal, 40)
      }
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
  
  private func deleteTaskToDo() {
    do {
      try modelContext.delete(model: TaskToDo.self)
    } catch {
      print("Error Deleting the TaskToDo")
    }
  }
}

private struct TaskView: View {
  var taskToDo: TaskToDo
  @Binding var tasksCompleted: Int
  var body: some View {
    HStack {
      Text(taskToDo.name)
        .font(.system(size: 25))
        .fontWeight(.medium)
        .font(.custom("Inter-Bold", size: 18))
        .foregroundColor(.white)
      
      Spacer()
      
      VStack {
        StatusBox(taskToDo: taskToDo, tasksCompleted: $tasksCompleted)
      }
      .frame(width: 40, height: 40)
      .background(.dayTaskY)
    }
    .padding()
    .background(.daytaskfield)
  }
}

private struct StatusBox: View {
  var taskToDo: TaskToDo
  @Binding var tasksCompleted: Int
  @Environment(\.modelContext) var modelContext
  var body: some View {
    Button(action: {
      if taskToDo.status.rawValue == "done" {
        taskToDo.status = .notDone
        tasksCompleted -= 1
      } else if taskToDo.status.rawValue == "notDone" {
        taskToDo.status = .done
        tasksCompleted += 1
      }
      
      do {
        try modelContext.save()
      } catch  {
        print("Error in updating a task status")
      }
    }) {
      Image(systemName: taskToDo.status.rawValue == "done" ? "checkmark.circle" : taskToDo.status.rawValue == "notDone" ? "circle" : "")
        .font(.system(size: 25))
        .foregroundStyle(.black)
        .tint(.black)
    }
  }
}


private struct AddTaskViewModal: View {
  var task: Task
  @State private var fieldValue = ""
  @Environment(\.modelContext) var modelContext
  @Environment(\.dismiss) var dismiss
  var body: some View {
    VStack {
      Button(action: {
        dismiss()
      }) {
        Image(systemName: "xmark")
          .font(.system(size: 15))
          .padding(.all, 8)
          .background(.gray)
          .clipShape(Circle())
          .tint(.dayTaskY)
      }
      .padding(.top, 10)
      .padding(.trailing, 10)
      .frame(maxWidth: .infinity, alignment: .trailing)
      
      Spacer()
      
      VStack(spacing: 20) {
        TextField("", text: $fieldValue, prompt: Text("task to do"))
          .tint(.dayTaskY)
          .padding()
          .overlay(content: {
            RoundedRectangle(cornerRadius: 4)
              .stroke(.dayTaskY, lineWidth: 3)
          })
        Button(action: {
          if !fieldValue.isEmpty {
            addNewTask()
            dismiss()
          }
        }){
          Text("Add")
            .foregroundStyle(.black)
            .font(.system(size: 20))
            .padding(.vertical)
            .padding(.horizontal, 40)
            .background(.dayTaskY)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
      }
      .padding()
      
      Spacer()
    }
  }
  
  func addNewTask() {
    let taskToDo = TaskToDo(name: fieldValue, task: task)
    
    modelContext.insert(taskToDo)
    
    if let tasksToDo = task.tasksToDo, !tasksToDo.isEmpty {
      task.tasksToDo?.append(taskToDo)
    }
  }
}


#Preview {
  NavigationStack {
    TaskDetail(task: Task(title: "", detail: "", dueDate: .now))
  }
}
