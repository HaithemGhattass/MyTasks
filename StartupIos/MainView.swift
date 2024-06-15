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
              HomeView()
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
        .padding(.top,getSafeArea().top)
        .background(Color.white)
    }

}


#Preview {
    MainView()
}


