//
//  CircularProgressive.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 11/05/2025.
//

import SwiftUI

struct CircularProgressView: View {
  let progress: Int

  var body: some View {
    ZStack {
      // Background for the progress bar
      Circle()
        .stroke(lineWidth: 2)
        .foregroundColor(.daytaskProgre)
      
      Text("\(progress)%")
        .foregroundStyle(.white)

      // Foreground or the actual progress bar
      Circle()
        .trim(from: 0.0, to: CGFloat(progress) / CGFloat(100))
        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
        .foregroundColor(.dayTaskY)
        .animation(.linear, value: progress)
    }
  }
}


#Preview {
    CircularProgressView(progress: 30)
}
