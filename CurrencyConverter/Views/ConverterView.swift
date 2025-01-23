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
    
    @State var conversionsMade: [Conversion] = []
    
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
                
                Button {
                    reset()
                } label: {
                    Text("Reset")
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                
                Text("\(givenInput) Canadian Dollar = ")
                
                Text("\(convertedAmount) US Dollars")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                
                HStack {
                    Text("Conversion History")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                List(conversionsMade.reversed()) { currentConversion in
                    HStack {
                        Spacer()
                        ConversionView(somePriorConversion: currentConversion)
                        Spacer()
                    }
                    
                }
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
            convertedAmount = ""
            return
        } else {
            feedback = "Conversion Succeeded"
        }
    
        let result = amountOfCurrency * cadToUsd
        
        let formattedConvertedAmount = result.formatted(.number.precision(.fractionLength(2)))
        
        convertedAmount = String(formattedConvertedAmount)
        
        let latestConversion = Conversion(cad: amountOfCurrency, usd: result)
        
        conversionsMade.append(latestConversion)

    
    }
    
    func reset() {
        
        givenInput = ""
        
        feedback = ""
                
        conversionsMade.removeAll()
        
        convertedAmount = ""
    }
}

#Preview {
    ConverterView()
}
