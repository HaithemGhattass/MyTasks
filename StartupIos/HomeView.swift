//
//  HomeView.swift
//  StartupIos
//
//  Created by haithem ghattas on 15/6/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var taskModel: TaskViewModel = TaskViewModel()
    @Namespace var animation

    var body: some View {
      NavigationStack{
              ScrollView(.horizontal,showsIndicators: false){
                  HStack(spacing:10){
                      ForEach(taskModel.currentWeek,id: \.self){ day in
                          VStack(spacing:10){
                              Text(taskModel.extractDate(date: day, format: "dd"))
                                  .font(.system(size:15))
                                  .fontWeight(.semibold)
                              Text(taskModel.extractDate(date: day, format: "EEE"))
                                  .font(.system(size:14))
                                  .fontWeight(.semibold)
                              Circle().fill(.white)
                                  .frame(width:8,height: 8)
                                  .opacity(taskModel.isToday(date: day) ? 1 : 0)
                          }
                          //MARK: Foreground Style
                          .foregroundStyle(taskModel.isToday(date: day) ? .primary : .tertiary )
                          .foregroundColor(taskModel.isToday(date: day) ? .white : .black)
                          //MARK: Capsule shape
                          .frame(width: 45,height: 90)
                          .background(
                              ZStack{
                                 //MARK: Matched geometry effect
                                  if taskModel.isToday(date: day){
                                      Capsule()
                                          .fill(.pink)
                                          .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                  }
                                  
                              }
                          )
                          .contentShape(Capsule())
                          .onTapGesture {
                              // Updating current day
                              withAnimation{
                                  taskModel.currentDay = day
                              }
                          }
                      }
                  }
                  .padding(.horizontal)
              }
              
              .background(Color.white)
          
          ScrollView(.vertical,showsIndicators: false) {
              //MARK: Lazy stack with pinned header
              LazyVStack(spacing:15,pinnedViews: [.sectionHeaders]){
                  Section {
                      //MARK: Current week view
                      TasksView()
                  }              }
          }
          .ignoresSafeArea(.container,edges: .top)
             
     }
    }
    //MARK: Tasks View
    func TasksView()-> some View {
        LazyVStack(spacing: 18){
            if let tasks = taskModel.filteredTasks {
                if tasks.isEmpty {
                    Text("No tasks found!!!")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .offset(y:100)
                }else {
                    ForEach(tasks){ task in
                        TaskCardView(task: task)
                        
                    }
                }
            } else {
                //MARK: Progress View
                ProgressView()
                    .offset(y:100)
            }
        }
        .padding()
        .padding(.top)
        //MARK: Updating Tasks
        .onChange(of:taskModel.currentDay) { newValue in
            taskModel.filterTodayTasks()
        }

    }
    //MARK: Task card View
    func TaskCardView(task: Task) -> some View{
        HStack(alignment:.top ,spacing: 30) {
            VStack(spacing:10) {
                Circle().fill(.black)
                    .frame(width:15,height: 15)
                    .background(
                        Circle().stroke(.black,lineWidth: 1)
                            .padding(-3)
                    )
                Rectangle()
                    .fill(.black)
                    .frame(width: 3)
            }
            VStack{
                HStack(alignment:.top , spacing: 10){
                    VStack(alignment: .leading,spacing: 12){
                        Text(task.taskTitle).font(.title3.bold())
                        Text(task.taskDescription).font(.callout).foregroundStyle(.secondary)
                    }
                    .hLeading()
                    
                    Text(task.taskDate.formatted(date:.omitted,time: .shortened))
                }
                
            }
            .foregroundColor(.white)
            .padding()
            .hLeading()
            .background(Color(.systemPink).cornerRadius(25))
        }
        .hLeading()
    }
}

#Preview {
    HomeView()
}
