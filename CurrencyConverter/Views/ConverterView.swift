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
    
    @State var conversionsMade: [Int] = []
    
    let cadToUsd = 0.698
    
    let usdToCad = 1.396
    
    
    //Computed properties
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
    }
}

#Preview {
    ConverterView()
}
