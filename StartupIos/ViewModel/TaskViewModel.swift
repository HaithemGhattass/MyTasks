//
//  TaskViewModel.swift
//  StartupIos
//
//  Created by haithem ghattas on 15/6/2024.
//

import SwiftUI

class TaskViewModel: ObservableObject{
    
    //MARK: initialization
    init(){
        fetchCurrentWeek()
    }
    
    //MARK: current week days
    @Published var currentWeek: [Date] = []
    
    //MARK: Current Day
    @Published var currentDay: Date = Date()
    
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
