//
//  ContentView.swift
//  MyConversion
//
//  Created by Nirusan Manoharan on 2025-03-27.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        ZStack{
            TabView{
                weightConversion().tabItem{
                    Image(systemName: "scalemass.fill")
                    Text("Weight")
                }.foregroundColor(.black)
                
                
                moneyConversion().tabItem{
                    Image(systemName: "dollarsign.circle.fill")
                    Text("Money")
                }
            }.accentColor(.black)
            
        }
    }
    
    
    
}

#Preview {
    ContentView()
}
