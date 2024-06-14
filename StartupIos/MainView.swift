//
//  MainView.swift
//  StartupIos
//
//  Created by haithem ghattas on 14/6/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Group {
                NavigationStack {
                    Text("calandar view").onTapGesture {
                         print("tapped")
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
}

#Preview {
    MainView()
}
