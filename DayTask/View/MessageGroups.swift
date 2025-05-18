//
//  MessageGroups.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 13/05/2025.
//

import SwiftUI

struct MessageGroups: View {
  @Environment(\.dismiss) var dismiss
  var groups = [
    Group(name: "Android Developer", logo: "team1", members: ["member1", "member3", "member5"]),
    Group(name: "IOS Developer", logo: "team2", members: ["member2", "member4", "member5"]),
    Group(name: "Web Developer", logo: "team3", members: ["member1", "member3", "member4", "member5"]),
    Group(name: "Back-End Team", logo: "team4", members: ["member1", "member3", "member5"]),
    Group(name: "Front-End Team", logo: "team5", members: ["member1", "member3", "member2", "member5"]),
    Group(name: "Android Developer", logo: "team6", members: ["member1", "member3", "member5"]),
    Group(name: "Personal Project", logo: "team7", members: ["member1", "member3", "member5"]),
    Group(name: "School System Project", logo: "team8", members: ["member1", "member2", "member5", "member3", "member4"]),
    
  ]
  var body: some View {
    ZStack {
      Color.dayTask
        .ignoresSafeArea()
      
      VStack {
//        HStack {
//          MsgButton(text: "Chat")
//            .frame(width: 170, height: 50)
//            .foregroundStyle(.white)
//            .background(.daytaskTab)
//          Spacer()
//          MsgButton(text: "Groups")
//            .frame(width: 170, height: 53)
//            .foregroundStyle(.black)
//            .background(.dayTaskY)
//        }
        
        ScrollView {
          VStack(alignment: .leading, spacing: 30) {
            ForEach(groups) { group in
              HStack(spacing: 15) {
                Image(group.logo)
                
                VStack(alignment: .leading) {
                  Text(group.name)
                    .fontWeight(.semibold)
                    .font(.custom("Inter-Bold", size: 24))
                    .foregroundStyle(.white)
                  
                  HStack(spacing: -5) {
                    ForEach(group.members.indices, id: \.self) { index in
                      Image(group.members[index])
                    }
                  }
                }
              }
            }
          }
          .padding(.top, 30)
          .frame(maxWidth: .infinity, alignment: .leading)
        }
      }
      .padding(.top, 20)
      .padding(.horizontal, 18)
      .navigationTitle("Messages")
      .navigationBarTitleDisplayMode(.inline)
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
        
        
        ToolbarItem(placement: .topBarTrailing) {
          Button(action: {}) {
            Button(action: {}) {
              Image("edit")
            }
          }
        }
      })
    }
  }
}

#Preview {
  NavigationStack {
    MessageGroups()
  }
}
