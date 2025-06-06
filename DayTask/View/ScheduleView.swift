//
//  Schedule.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 13/05/2025.
//

import SwiftUI
import SwiftData

struct ScheduleView: View {
  @State private var currentDate = Date()
  @State private var currentTask = Task()
  @State private var currentWeekIndex = 1
  @State private var weekSlider = [[Date.WeekDay]]()
  @State private var createWeek = false
  @Namespace private var animation
  @Query var tasks: [Task]
//  @Environment(\.modelContext) var modelContext
  
  var body: some View {
    NavigationStack {
      ZStack {
        Color.dayTask
          .ignoresSafeArea()
        
        VStack(spacing: 40) {
          HeaderView()
          
          VStack(alignment: .leading, spacing: 25) {
            Text("Today’s Tasks")
              .fontWeight(.semibold)
              .font(.system(size: 20))
              .foregroundStyle(.white)
            
            ScrollView {
              VStack {
                if let tasksToDo = currentTask.tasksToDo {
                  ForEach(tasksToDo) { task in
                    TasksForTheDay(taskToDo: task)
                  }
                }
              }
            }
          }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
      }
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden(true)
      .toolbar(content: {
        
        ToolbarItem(placement: .principal) {
          Text("Schedule")
            .font(.title)
            .foregroundStyle(.white)
        }
        
        ToolbarItem {
          NavigationLink(destination: NewTask()) {
            Image(systemName: "plus.app")
              .foregroundStyle(.white)
              .font(.system(size: 24))
          }
        }
      })
      .onAppear(perform: {
        if weekSlider.isEmpty {
          let currentWeek = currentDate.fetchWeek()
          
          if let firstDate = currentWeek.first?.date {
            weekSlider.append(firstDate.createPreviousWeek())
          }
          
          weekSlider.append(currentWeek)
          
          if let lastDate = currentWeek.last?.date {
            weekSlider.append(lastDate.createNextWeek())
          }
        }
        
        let tasks = tasks.filter {$0.dueDate.isSameDate(date: currentDate)}
        
        if let task = tasks.first {
          currentTask = task
        }
      })
    }
  }
  
  func HeaderView() -> some View {
    VStack(alignment: .leading) {
      HStack {
        Text(currentDate.format("MMMM"))
        Text(currentDate.format("YYYY"))
      }
      .foregroundStyle(.white)
      .font(.custom("Inter-Bold", size: 25))
      .fontWeight(.semibold)
      
      TabView(selection: $currentWeekIndex) {
        ForEach(weekSlider.indices, id: \.self) { index in
          let week = weekSlider[index]
          
          WeekView(week)
            .padding(.horizontal, 15)
            .tag(index)
        }
      }
      .padding(.horizontal, -15)
      .tabViewStyle(.page(indexDisplayMode: .never))
      .frame(height: 90)
    }
    .onChange(of: currentWeekIndex) { (oldValue, newValue) in
      if newValue == 0 || newValue == ((weekSlider.count) - 1) {
        createWeek = true
      }
    }
  }
  
  func WeekView(_ week: [Date.WeekDay]) -> some View {
    HStack {
      ForEach(week) { day in
        VStack {
          Text(day.date.format("dd"))
            .fontWeight(.semibold)
            .font(.system(size: 18.82))
            .padding(.top, 10)
          
          Text(day.date.format("E"))
            .fontWeight(.medium)
            .font(.system(size: 9.41))
            .padding(.bottom, 5)
        }
        .foregroundStyle(isSameDate(day.date, currentDate) ? .black : .white)
        .padding(.horizontal, 10)
        .background(content: {
          Rectangle()
            .fill(.daytaskTab)
          
          if isSameDate(day.date, currentDate) {
            Rectangle()
              .fill(.dayTaskY )
              .matchedGeometryEffect(id: "TabINDICATION", in: animation)
          }
          
          if day.date.isToday {
            RoundedRectangle(cornerRadius: 4)
              .stroke(.dayTaskY, lineWidth: 3)
          }
        })
        .onTapGesture {
          withAnimation(.snappy) {
            currentDate = day.date
          }
        }
      }
    }
    .background(content: {
      GeometryReader {
        let minX = $0.frame(in: .global).minX
        
        Color.clear
          .preference(key: OffsetKey.self, value: minX)
          .onPreferenceChange(OffsetKey.self, perform: { value in
            
            if value.rounded() == 21 && createWeek {
              paginateWeek()
              createWeek = false
            }
          })
      }
    })
  }
  
  func paginateWeek() {
    if weekSlider.indices.contains(currentWeekIndex) {
      if let firstDate =  weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
        weekSlider.insert(firstDate.createPreviousWeek(), at: 0)
        weekSlider.removeLast()
        currentWeekIndex = 1
      }
      
      if let lastDate =  weekSlider[currentWeekIndex].last?.date, currentWeekIndex == (weekSlider.count - 1) {
        weekSlider.append(lastDate.createNextWeek())
        weekSlider.removeFirst()
        currentWeekIndex = weekSlider.count - 2
      }
    }
  }
  
  func TasksForTheDay(taskToDo: TaskToDo) -> some View {
    ZStack {
      Rectangle()
        .fill(.dayTaskY)
      
      Rectangle()
        .fill(taskToDo.status.rawValue == "done" ? .dayTaskY : .daytaskTab)
        .padding(.leading, 10)
      
      HStack {
        VStack(alignment: .leading, spacing: 10) {
          Text(taskToDo.name)
            .fontWeight(.medium)
            .font(.custom("Inter-Bold", size: 18))
            .foregroundStyle(taskToDo.status.rawValue == "done" ? .black : .white)
            .strikethrough(taskToDo.status.rawValue == "done", color: .black)
          
          Text("16:00 - 18:30")
            .fontWeight(.regular)
            .font(.custom("Inter-Bold", size: 12))
            .foregroundStyle(taskToDo.status.rawValue == "done" ? .black : .white)
            .strikethrough(taskToDo.status.rawValue == "done", color: .black)
        }
        
        Spacer()
        
        HStack(spacing: -5) {
          ForEach(1...3, id: \.self) { index in
            Image("member\(index + 1)")
              .overlay(content: {
                RoundedRectangle(cornerRadius: 25)
                  .stroke(style: StrokeStyle())
              })
          }
        }
      }
      .padding()
      .frame(maxWidth: .infinity)
    }
  }
  
}

#Preview {
  ScheduleView()
    .modelContainer(previewContainer)
}
