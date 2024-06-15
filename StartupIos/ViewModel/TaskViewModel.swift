//
//  TaskViewModel.swift
//  StartupIos
//
//  Created by haithem ghattas on 15/6/2024.
//

import SwiftUI

class TaskViewModel: ObservableObject{
    
    @Published var storedTasks: [Task] =
    [
        Task(taskTitle: "run", taskDescription: "run into the river", taskDate: Date.now),
        Task(taskTitle: "yoga", taskDescription: "yoga at the roof", taskDate: Date.now )
          
    ]
    
    //MARK: current week days
    @Published var currentWeek: [Date] = []
    
    //MARK: Current Day
    @Published var currentDay: Date = Date()
    
    //MARK: Filtering Today Task
    @Published var filteredTasks:[Task]?
    
    //MARK: initialization
    init(){
        fetchCurrentWeek()
        filterTodayTasks()
    }
    
    //MARK: Filter today tasks
    func filterTodayTasks(){
        DispatchQueue.global(qos: .userInteractive).async {
            let calendar = Calendar.current
            let filtered = self.storedTasks.filter{
                return calendar.isDate($0.taskDate,inSameDayAs: self.currentDay)
            }
            DispatchQueue.main.async {
                withAnimation{
                    self.filteredTasks = filtered
                }
            }
        }
    }
    
    
    func fetchCurrentWeek(){
        let today = Date()
        let calendar =  Calendar.current
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        guard let firstWeekDay = week?.start else {
            return
        }
        (1...7).forEach{ day in
           if let weekday = calendar.date(byAdding: .day, value: day,to:firstWeekDay){
                currentWeek.append(weekday)
            }
        }
    }
    
    //MARK: extracting Date
    func extractDate(date: Date, format: String) ->  String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
        
    }
    //MARK: checking if current Date is Today
    func isToday(date:Date)->Bool{
        let calendar = Calendar.current
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
}
