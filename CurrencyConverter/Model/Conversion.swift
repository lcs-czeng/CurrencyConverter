//
//  ConversionRate.swift
//  CurrencyConverter
//
//  Created by 曾梓恒 on 2025-01-20.
//

import Foundation

struct Conversion: Identifiable {
    let id = UUID()
    let cad: Double
    let usd: Double
}

let conversionForPreview = Conversion(cad: 123, usd: 456)
