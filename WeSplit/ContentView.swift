//
//  ContentView.swift
//  WeSplit
//
//  Created by Farrel hasyidan on 06/04/21.
//

import SwiftUI

struct ContentView: View {
  
  @State private var CheckAmmont = ""
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 2
  
  let tipPercentages = [10, 15, 20, 25, 0]
  
  var totalPerPerson: Double{
    let peopleCount = Double(numberOfPeople + 2)
    let tipsSelection = Double(tipPercentages[tipPercentage])
    let orderAmount = Double(CheckAmmont) ?? 0
    
    let tipValue = orderAmount / 100 * tipsSelection
    let grandTotal = orderAmount + tipValue
    let AmountPerPerson = grandTotal / peopleCount
    
    return AmountPerPerson
  }
  
  var body: some View{
    NavigationView{
      
      Form{
        Section {
          TextField("Amount", text: $CheckAmmont)
          Picker("Number of people", selection: $numberOfPeople){
            ForEach(2..<20){ number in
              Text("\(number) people")
            }
          }
        }
        
        Section(header: Text("How muct tip do you want to leave")){
          Picker("Tip Percentage", selection: $tipPercentage){
            ForEach(0..<tipPercentages.count) {
              Text("\(self.tipPercentages[$0])%")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        
        Section{
          Text("$\(totalPerPerson, specifier: "%.2f")")
        }
      }
      .navigationBarTitle("We Split")
    }
  }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
