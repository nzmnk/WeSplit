//
//  ContentView.swift
//  WeSplit
//
//  Created by Никита Зименко on 05.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
//    @State private var numberOfPeople = 2
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2

    let tipPercentages = [10, 15, 20, 25, 0]

    var totalPerPerson: Double {
//        let peopleCount = Double(numberOfPeople + 2)
        let peopleCount = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var totalCheck: Double {
        _ = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }

    var body: some View {
       
        NavigationView {
            Form {
                
                Section {
                    TextField("Lunch Cost", text: $checkAmount)
                        .keyboardType(.decimalPad)

//                    Picker("Number of people", selection: $numberOfPeople) { //Working Picker Method
//                        ForEach(2 ..< 100) {
//                            Text("\($0) people")
//                        }
//                    }
                    
                    TextField("Number of persons", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Choose the Tip")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section (header: Text("Total with Tip")) {
                    Text("$\(totalCheck, specifier: "%.2f")")
                }

                Section (header: Text("Total per Person")) {
                    Text("$\(totalPerPerson, specifier: "%g")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
