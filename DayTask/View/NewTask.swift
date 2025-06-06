//
//  NewTask.swift
//  DayTask
//
//  Created by Emmanuel Isiwu on 15/05/2025.
//

import SwiftUI
import PhotosUI

struct NewTask: View {
  @State private var addTeamMember = false
  @State private var isSaving = false
  @Bindable private var newTaskViewModel = NewTaskViewModel()
  @Environment(\.dismiss) var dismiss
  @Environment(\.modelContext) var modelContext
  
  var body: some View {
    NavigationStack {
      ZStack {
        Color.dayTask
          .ignoresSafeArea()
        
        ScrollView {
          VStack {
            VStack(spacing: 30) {
              FormTextField(label: "Task Title", placeholder: "Hi-Fi Wireframe", value: $newTaskViewModel.title)
              
              FormTextEditor(label: "Task Details", value: $newTaskViewModel.detail)
              
              VStack(alignment: .leading) {
                Text("Add team members")
                  .fontWeight(.semibold)
                  .font(.custom("Inter-Bold", size: 25))
                  .foregroundStyle(.white)
                
                HStack {
                  ScrollView(.horizontal) {
                    HStack {
                      ForEach(newTaskViewModel.teams.indices, id: \.self) { (index) in
                        TeamMemberView(team: newTaskViewModel.teams[index], deleteTeam: deleteTeam)
                      }
                    }
                  }
                  .scrollIndicators(.hidden, axes: .horizontal)
                  
                  Button(action: {
                    addTeamMember.toggle()
                  }) {
                    Image(systemName: "plus.app")
                      .font(.system(size: 28))
                      .padding()
                  }
                  .background(.dayTaskY)
                }
              }
              
              VStack(alignment: .leading) {
                Text("Time & Date")
                  .fontWeight(.black)
                  .font(.custom("Inter-Bold", size: 25))
                  .foregroundStyle(.white)
                
                HStack {
                  TimeView(image: "clock", date: $newTaskViewModel.date, time: $newTaskViewModel.time)
                  TimeView(image: "calendar", date: $newTaskViewModel.date, time: $newTaskViewModel.time)
                }
              }
            }
            
            Spacer()
            
            if newTaskViewModel.isSaving {
              ButtonView(buttonText: "Create", action: createNewTask, isLoading: newTaskViewModel.isSaving)
                .padding(.top, 70)
            } else {
              ButtonView(buttonText: "Create", action: createNewTask, isLoading: newTaskViewModel.isSaving)
                .padding(.top, 70)
            }
          }
          .padding()
        }
      }
//      .overlay(content: {
//        if isSaving {
//          LoadingView()
//        }
//      })
    }
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
      
      ToolbarItem(placement: .principal) {
        Text("Create New Task")
          .foregroundStyle(.white)
          .font(.system(size: 24))
      }
    })
    .sheet(isPresented: $addTeamMember, content: {
      AddTeamMemberView(addTeamHandler: addTeamHandler)
    })
  }
  
  private func createNewTask() {
    newTaskViewModel.saving(isSaving: true)
    let task = Task(title: newTaskViewModel.title, detail: newTaskViewModel.detail, dueDate: newTaskViewModel.date)
    
    for team in newTaskViewModel.teams {
      let newMember = TeamMember(name: team.name, image: team.image.pngData()!, task: task)
      
      modelContext.insert(newMember)
      
      do {
        try modelContext.save()
      } catch  {
        print("Error saving")
      }
//      try modelContext.save()
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
      newTaskViewModel.saving(isSaving: false)
      newTaskViewModel.reset()
    }
  }
  
  private func addTeamHandler(_ team: TeamMemberViewModel) {
    if !team.name.isEmpty {
      newTaskViewModel.teams.append(team)
    }
  }
  
  private func deleteTeam(_ team: TeamMemberViewModel) {
    newTaskViewModel.teams = newTaskViewModel.teams.filter{ $0.id != team.id }
  }
}

private struct FormTextField: View {
  var label: String
  var placeholder: String
  @Binding var value: String
  var body: some View {
    VStack(alignment: .leading) {
      Text(label.capitalized)
        .fontWeight(.semibold)
        .font(.custom("Inter-Bold", size: 25))
        .foregroundStyle(.white)
      
      TextField("", text: $value, prompt: Text(placeholder).foregroundStyle(.white))
        .foregroundStyle(.white)
        .font(.system(size: 20))
        .fontWeight(.regular)
        .padding(.vertical)
        .padding(.horizontal, 20)
        .background(.daytaskfield)
        .tint(.dayTaskY)
    }
  }
}

private struct FormTextEditor: View {
  var label: String
//  var placeholder: String
  @Binding var value : String
  var body: some View {
    VStack(alignment: .leading) {
      Text(label.capitalized)
        .fontWeight(.semibold)
        .font(.custom("Inter-Bold", size: 25))
        .foregroundStyle(.white)
      
      TextEditor(text: $value)
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .foregroundStyle(.white)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .scrollContentBackground(.hidden)
        .background(.daytaskfield)
        .tint(.dayTaskY)
    }
  }
}

private struct TeamMemberView: View {
  var team: TeamMemberViewModel
  var deleteTeam: (TeamMemberViewModel) -> Void
  var body: some View {
    HStack {
      HStack {
        Image(uiImage: team.image)
          .resizable()
          .scaledToFit()
          .frame(width: 30, height: 30)
          .clipShape(Circle())
        Text(team.name)
      }
      .padding(.trailing, 50)
      Button(action: {
        deleteTeam(team)
      }) {
        Image(systemName: "xmark.square")
      }
    }
    .foregroundStyle(.white)
    .font(.system(size: 24))
    .padding()
    .background(.daytaskfield)
  }
}

struct TimeView: View {
  var image: String
  @Binding var date: Date
  @Binding var time: Date
  @State private var showDatePicker = false
  @State private var showTimePicker = false
  
  let timeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "hh:mm a"
    
    return formatter
  }()
  
  let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "dd/MM/yyyy"
    
    return formatter
  }()
  var body: some View {
    HStack(spacing: -8) {
      if image == "clock" {
        Image(systemName: image)
          .font(.system(size: 28))
          .padding(.all, 12)
          .background(.dayTaskY)
          .onTapGesture {
            showTimePicker.toggle()
          }
          .popover(isPresented: $showTimePicker, attachmentAnchor: .point(.top), content: {
            DatePicker("", selection: $time, displayedComponents: [.hourAndMinute])
              .datePickerStyle(.wheel)
              .frame(minWidth: 300, maxHeight: 400)
              .presentationCompactAdaptation(.popover)
              .onChange(of: time) { _, _ in
                showTimePicker.toggle()
              }
          })


        Text(timeFormatter.string(from: time))
          .font(.system(size: 20))
          .foregroundStyle(.white)
          .padding(.vertical)
          .padding(.trailing)
          .padding(.leading, 10)
          .background(.daytaskfield)
      } else {
        Image(systemName: image)
          .font(.system(size: 28))
          .padding(.all, 12)
          .background(.dayTaskY)
          .onTapGesture {
            showDatePicker.toggle()
          }
          .popover(isPresented: $showDatePicker, attachmentAnchor: .point(.topLeading), content: {
            DatePicker("", selection: $date, displayedComponents: [.date])
              .datePickerStyle(.graphical)
              .frame(minWidth: 300, maxHeight: 400)
              .presentationCompactAdaptation(.popover)
              .onChange(of: date) { _, _ in
                showDatePicker.toggle()
              }
          })


        Text(dateFormatter.string(from: date))
          .font(.system(size: 20))
          .foregroundStyle(.white)
          .padding(.vertical)
          .padding(.trailing)
          .padding(.leading, 4)
          .background(.daytaskfield)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: 50)
  }
}

private struct AddTeamMemberView: View {
  var addTeamHandler: ((TeamMemberViewModel) -> Void)?
  @State private var memberName: String = ""
  @State private var image: UIImage = UIImage(named: "notif2")!
  @State private var avatarItem: PhotosPickerItem?
  @Environment(\.dismiss) var dismiss
  var body: some View {
    NavigationStack {
      VStack {
        ZStack {
          Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: 140, height: 140)
            .clipShape(Circle())
            .padding(.all, 8)
            .overlay(content: {
              Circle()
                .stroke(.dayTaskY, lineWidth: 5)
          })
          
          PhotosPicker(selection: $avatarItem, matching: .images) {
            Image(systemName: "plus.app")
              .foregroundStyle(.white)
              .font(.system(size: 30))
              .padding(.all, 8)
              .background(.black)
              .clipShape(Circle())
          }
          .offset(x: 40 ,y: 60)
          .task(id: avatarItem, {
            if let data = try? await avatarItem?.loadTransferable(type: Data.self
            ) {
              image = UIImage(data: data)!
            }
          })
        }
        .padding(.bottom, 20)
        
        TextField("", text: $memberName, prompt: Text("Team Member Name"))
          .tint(.dayTaskY)
          .padding(.vertical)
          .padding(.horizontal, 8)
          .overlay(content: {
            RoundedRectangle(cornerRadius: 4)
              .stroke(.dayTaskY, lineWidth: 3)
          })
        
        VStack(alignment: .trailing) {
          Button(action: {
            if let addTeamHandler = addTeamHandler, !memberName.isEmpty {
              let member = TeamMemberViewModel(name: memberName, image: image)
              
              // CALL HANDLER
              addTeamHandler(member)
              // DISMISS MODAL
              dismiss()
            }
          }) {
            Text("Add")
              .foregroundStyle(.black)
              .padding(.vertical)
              .padding(.horizontal, 50)
              .background(.dayTaskY)
          }
        }
        .padding(.top, 80)
        .frame(maxWidth: .infinity, alignment: .trailing)
      }
      .padding()
      .toolbarBackground(.visible, for: .navigationBar)
      .toolbarBackground(.white, for: .navigationBar)
      .toolbar(content: {
        ToolbarItem(placement: .topBarLeading) {
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
        }
      })
    }
  }
}

#Preview {
    NavigationStack {
      NewTask()
        .modelContainer(previewContainer)
    }
}

#Preview("2") {
  AddTeamMemberView()
}
