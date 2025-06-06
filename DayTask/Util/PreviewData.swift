//
//  PreviewData.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 27/05/2025.
//

import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
      let container = try ModelContainer(
        for: Task.self, TaskToDo.self, TeamMember.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true)
      )
      
      return container
    } catch {
        fatalError("Failed to create container")
    }
}()
