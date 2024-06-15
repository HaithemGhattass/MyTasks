//
//  MainView.swift
//  StartupIos
//
//  Created by haithem ghattas on 14/6/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var taskModel: TaskViewModel = TaskViewModel()
    @Namespace var animation
    var body: some View {
        TabView {
            Group {
                NavigationStack {
                    ScrollView(.vertical,showsIndicators: false) {
                        //MARK: Lazy stack with pinned header
                        LazyVStack(spacing:15,pinnedViews: [.sectionHeaders]){
                            Section {
                                //MARK: Current week view
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
                                
                            }header: {
                                HeaderView()
                            }
                        }
                    }
                       
               }
               .tabItem {
                   Label("Home", systemImage: "house")
               }

                Text("Overall View")
                               .tabItem {
                                   Label("Overall", systemImage: "doc")
                               }
                Text("Charts View")
                            .tabItem {
                                Label("charts", systemImage: "chart.pie.fill")
                            }
                
                Text("Settings View")
                    .tabItem {
                        Label("Tab 3", systemImage: "gear")
                    }
                }
            
           

        }
        .accentColor(Color.pink)



    }
    //MARK: header
    func HeaderView()-> some View {
        HStack(alignment: .center, spacing:10){
            VStack(alignment: .leading,spacing: 10){
                Text(Date().formatted(date:.abbreviated,time: .omitted))
                    .foregroundColor(.gray)
                Text("Today")
                    .font(.largeTitle.bold())
            }
            .hCenter()
            Button{
                
            }label: {
                Image(systemName: "gear")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45,height: 45)
                    .clipShape(Circle())
            }
                   
        }
        .padding()
        .background(Color.white)
    }
}

#Preview {
    MainView()
}

//MARK: UI design helper function
extension View {
    func hLeading()-> some View {
        self.frame(maxWidth: .infinity,alignment: .leading)
    }  
    func hTrailing()-> some View {
        self.frame(maxWidth: .infinity,alignment: .trailing)
    }
    func hCenter()-> some View {
        self.frame(maxWidth: .infinity,alignment: .center)
    }
   
}
