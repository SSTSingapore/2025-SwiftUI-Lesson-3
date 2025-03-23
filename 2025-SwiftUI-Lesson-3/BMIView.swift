//
//  BMIView.swift
//  2025-SwiftUI-Lesson-3
//
//  Created by Stanley Sim on 19/3/25.
//

import SwiftUI

struct BMIView: View {
    @State private var height: Double = 0
    @State private var weight: Double = 0
    @State private var bmi: Double = 0
    
    var body: some View {
        HStack {
            Text("Height")
                .padding()
            TextField("Height", value: $height, format: .number)
                .padding()
                .multilineTextAlignment(.center)
                .disableAutocorrection(true)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
        }
        HStack {
            Text("Weight")
                .padding()
            TextField("Weight", value: $weight, format: .number)
                .padding()
                .multilineTextAlignment(.center)
                .disableAutocorrection(true)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
            
        }
        Button("Calculate"){
            bmi = (weight / pow(height,2))
        }
        .padding()
        
        Text("\(bmi, specifier: "%.2f")")
            .padding()
        Text(getHealthRisk(bmi))
            .padding()
    }
}

func getHealthRisk(_ bmi: Double) -> String {
    switch bmi {
    case 0 ..< 18.5:
        return "Possible nutritional deficiency and osteoporosis."
    case 18.5 ..< 22.9:
        return "Low risk (healthy range)."
    case 22.9 ..< 27.4:
        return "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus"
    case 27.4 ..< 40:
        return "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome."
    default:
        return ""
    }
}

#Preview {
    BMIView()
}
