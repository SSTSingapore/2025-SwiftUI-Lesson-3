//
//  BMIView.swift
//  2025-SwiftUI-Lesson-3
//
//  Created by Stanley Sim on 19/3/25.
//

import SwiftUI

struct BMIView: View {
    @State private var height: Double?
    @State private var weight: Double?
    @State private var bmi: Double?
    
    var body: some View {
        HStack {
            Text("Height")
                .padding()
            TextField("m", value: $height, format: .number)
                .padding()
                .multilineTextAlignment(.center)
                .disableAutocorrection(true)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
        }
        HStack {
            Text("Weight")
                .padding()
            TextField("kg", value: $weight, format: .number)
                .padding()
                .multilineTextAlignment(.center)
                .disableAutocorrection(true)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
            
        }
        
        if let h = height, let w = weight {
            Button("Calculate"){
                bmi = getBMI(height: h, weight: w)
            }
            .padding()
            
            if let bmiValue = bmi {
                Text("\(bmiValue, specifier: "%.2f")")
                    .padding()
                Text(getHealthRisk(bmiValue))
                    .padding()
            }
            
        } else {
            Button("Calculate"){}
                .disabled(true)
                .padding()
        }
    }
}

func getBMI(height h: Double, weight w: Double) -> Double {
    let bmi = (w / pow(h,2))
    return bmi
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
