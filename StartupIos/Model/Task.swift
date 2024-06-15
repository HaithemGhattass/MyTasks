//
//  Task.swift
//  StartupIos
//
//  Created by haithem ghattas on 15/6/2024.
//

import SwiftUI

struct Task: Identifiable{
    var id = UUID().uuidString
    var taskTitle: String
    var taskDescription: String
    var taskDate: Date
}
