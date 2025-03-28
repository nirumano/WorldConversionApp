//
//  weightConversion.swift
//  MyConversion
//
//  Created by Nirusan Manoharan on 2025-03-27.
//

import SwiftUI

struct weightConversion: View {
    @State private var weightType: Bool = true
    @State private var weightType1: String = "lbs"
    @State private var weightTypeDisplay: String = "kg"
    @State private var weightValue: Double? = nil
    @State private var weightCalculated: Double = 0.0
    var body: some View {
        NavigationView{
            
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea(.all)
                
                
                VStack (alignment: .leading){
                    //                Text("Weight Conversion")
                    //                    .font(.title)
                    //                    .bold()
                    HStack{
                        Text("Enter \(weightType1): ")
                        TextField("Enter Your Weight", value: $weightValue, format: .number)
                            .font(.system(size: 10))
                            .foregroundColor(.purple)
                            .fontWeight(.bold)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 120)
                            .keyboardType(.decimalPad)
                            .onSubmit {
                                if let weight = weightValue {
                                    convertType(weightValue: weight, weightType: weightType1)
                                }
                                print("Type is: \(weightType1) + Bool is: \(weightType)")
                            }
                    }
                    
                    Text("You are \(weightCalculated, specifier: "%.1f") \(weightTypeDisplay)")
                    
                    Button{
                        weightType.toggle()
                        if weightType {
                            weightType1 = "lbs"
                            weightTypeDisplay = "kg"
                        } else {
                            weightType1 = "kg"
                            weightTypeDisplay = "lbs"
                        }
                        
                        weightValue = round(weightCalculated*10)/10
                        
                        
                        if let weight = weightValue {
                            convertType(weightValue: weight, weightType: weightType1)
                        }
                    }label: {
                        HStack{
                            Image(systemName: "arrow.clockwise")
                            Text("\(weightTypeDisplay) to \(weightType1)")
                        }.frame(width: 210, height: 30)
                            .background(.gray)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .frame(alignment: .center)
                        
                    }
                    Spacer()
                    
                }
                .padding(.top, 150)
                .navigationTitle("Weight Conversion")
            }
        }
    }
    func convertType(weightValue: Double, weightType: String){
        if weightType == "lbs" {
            weightCalculated = weightValue*0.4536
        }else{
            weightCalculated = weightValue*2.205
        }
    }
}

#Preview {
    weightConversion()
}
