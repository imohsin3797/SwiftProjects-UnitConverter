//
//  ContentView.swift
//  UnitConverter
//
//  Created by Ibrahim Mohsin on 10/6/24.
//

import SwiftUI

struct ContentView: View {
    @State var inputValue = 0.0
    @State var inputUnit = ""
    @State var convertTo = ""
    
    let units = ["mL", "Liters", "Cups", "Pints", "Gallons"]
    
    let literToMilliliter = 1000.0
    let cupToMilliliter = 236.588
    let pintToMilliliter = 473.176
    let gallonToMilliliter = 3785.41
    
    var inputUnitToMilliliter: Double {
        switch inputUnit {
            case "mL":
                return inputValue
            case "Liters":
                return inputValue * literToMilliliter
            case "Cups":
                return inputValue * cupToMilliliter
            case "Pints":
                return inputValue * pintToMilliliter
            default:
                return inputValue * gallonToMilliliter
            }
        }

        var outputValue: Double {
            switch convertTo {
                case "mL":
                    return inputUnitToMilliliter
                case "Liters":
                    return inputUnitToMilliliter / literToMilliliter
                case "Cups":
                    return inputUnitToMilliliter / cupToMilliliter
                case "Pints":
                    return inputUnitToMilliliter / pintToMilliliter
                default:
                    return inputUnitToMilliliter / gallonToMilliliter
                }
        }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Value and Unit") {
                    TextField("Input Value", value: $inputValue, format: .number)
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Convert to") {
                    Picker("Unit", selection: $convertTo) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output") {
                    Text("\(outputValue, specifier: "%.2f")")
                }
                }
                .navigationTitle("Volume Converter")
            }
        }
    }

#Preview {
    ContentView()
}
