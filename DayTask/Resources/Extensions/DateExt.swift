//
//  Date.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 03/06/2025.
//

import Foundation


extension Date {
  func format(_ format: String) -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = format
    
    return formatter.string(from: self)
  }
  
  var isToday: Bool {
    Calendar.current.isDateInToday(self)
  }
  
  func isSameDate(date: Date) -> Bool {
    Calendar.current.isDate(self, inSameDayAs: date)
  }
  
  struct WeekDay: Identifiable {
    var id: UUID = .init()
    var date: Date
  }
  
  func fetchWeek(_ date: Date = .init()) -> [WeekDay] {
    let calendar = Calendar.current
    let startOfDay = calendar.startOfDay(for: date)
    let weekForDate = calendar.dateInterval(of: .weekOfMonth, for: startOfDay)
    var week: [WeekDay] = []
    
    guard let startOfWeek = weekForDate?.start else {
      return []
    }
    
    (0..<7).forEach { index in
      if let weekDay = calendar.date(byAdding: .day, value: index, to: startOfWeek) {
        week.append(WeekDay(date: weekDay))
      }
    }
    
    return week
  }
  
  func createNextWeek() -> [WeekDay] {
    let calendar = Calendar.current
    let startOfLastDay = calendar.startOfDay(for: self)
    
    guard let nextDate = calendar.date(byAdding: .day, value: 1, to: startOfLastDay) else {
      return []
    }
    
    return fetchWeek(nextDate)
  }
  
  func createPreviousWeek() -> [WeekDay] {
    let calendar = Calendar.current
    let startOfFirstDate = calendar.startOfDay(for: self)
    
    guard let previousDate = calendar.date(byAdding: .day, value: -1, to: startOfFirstDate) else { return [] }
    
    return fetchWeek(previousDate)
  }
}
