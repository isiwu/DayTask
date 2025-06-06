//
//  CircularProgressive.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 11/05/2025.
//

import SwiftUI

struct CircularProgressView: View {
  var total: Int
  var progress: Int

  var body: some View {
    ZStack {
      // Background for the progress bar
      Circle()
        .stroke(lineWidth: 2)
        .foregroundColor(.daytaskProgre)
      
      Text("\(Int((Double(progress) / Double(total)) * 100))%")
        .foregroundStyle(.white)

      // Foreground or the actual progress bar
      Circle()
        .trim(from: 0.0, to: CGFloat(progress) / CGFloat(total))
        .stroke(lineWidth: 3)
        .foregroundColor(progress != 0 ? .dayTaskY : .daytaskProgre)
        .animation(.linear, value: progress)
    }
  }
}


#Preview {
  CircularProgressView(total: 100, progress: 30)
    .padding(.horizontal)
}
