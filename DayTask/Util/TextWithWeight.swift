//
//  TextWithWeight.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 05/05/2025.
//

import UIKit
import SwiftUI

struct TextWithWeight: UIViewRepresentable {
    
    let text: String
    let size: CGFloat?
    let weight: CGFloat
    let color: UIColor?
  
    init(text: String, size: CGFloat?, weight: CGFloat, color: UIColor?) {
      self.text = text
      self.size = size
      self.weight = weight
      self.color = color
    }
  
    init(text: String, weight: CGFloat, color: UIColor) {
      self.init(text: text, size: nil, weight: weight, color: color)
    }
  
    init(text: String, weight: CGFloat) {
      self.init(text: text, weight: weight, color: UIColor.black)
    }
    
//    typealias UIViewType = UITextView
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.text = text
        view.font = UIFont.systemFont(ofSize: size ?? 16, weight: UIFont.Weight.init(weight))
        view.textColor = color ?? UIColor.black
        view.backgroundColor = .none
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
    }
    
    @MainActor func sizeThatFits(_ proposal: ProposedViewSize, uiView: UITextView, context: Context) -> CGSize? {
        return uiView.sizeThatFits(proposal.replacingUnspecifiedDimensions())
    }
    
}

//#Preview {
//    TextWithWeight()
//}
