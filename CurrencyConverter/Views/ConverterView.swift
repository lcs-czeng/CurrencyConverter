//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by 曾梓恒 on 2025-01-20.
//

import SwiftUI

struct ConverterView: View {
    
    //Stored properties
    
    @State var givenInput = ""
    
    @State var feedback = ""
    
    @State var convertedAmount = ""
    
    @State var conversionsMade: [Int] = []
        
    let cadToUsd = 0.698
    
    let usdToCad = 1.396
    
    //Computed properties
    
    
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                
                Text("Conver your currency into another!")
                
                Text("CAD to USD")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                
                TextField("Amount of CAD", text: $givenInput)
                
                Text(feedback)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .foregroundStyle(.red)
                
                Button {
                    convertCurrency()
                } label: {
                    Text("Convert your money")
                }
                .buttonStyle(.borderedProminent)
                
                Text("\(givenInput) Canadian Dollar = ")
                
                Text("\(convertedAmount) US Dollars")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                
            }
            .padding()
            .navigationTitle("Currency Converter")
        }
    }
    
    //Functions
    
    func convertCurrency() {
        
        guard let amountOfCurrency = Double(givenInput) else {
            feedback = "Please enter a valid number."
            convertedAmount = ""
            return
        }
            
        if amountOfCurrency < 0 {
            feedback = "Please enter positive number."
        } else {
            feedback = "Conversion Succeeded"
        }
    
        let result = amountOfCurrency * cadToUsd
        
        let formattedConvertedAmount = result.formatted(.number.precision(.fractionLength(2)))
        
        convertedAmount = String(formattedConvertedAmount)
    
        
    }
}

#Preview {
    ConverterView()
}
