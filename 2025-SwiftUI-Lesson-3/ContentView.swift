//
//  ContentView.swift
//  2025-SwiftUI-Lesson-3
//
//  Created by Stanley Sim on 19/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("L3.001")
            NavigationStack {
                
                NavigationLink("BMI Calculator") {
                    BMIView().navigationTitle("BMI Calculator")
                }
                .padding()
                .background(.white)
                .cornerRadius(5)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
