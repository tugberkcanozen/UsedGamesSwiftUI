//
//  UsedGames+Formatter.swift
//  UsedGames
//
//  Created by Tuğberk Can Özen on 28.10.2022.
//

import Foundation

struct Formatters {
    static let dollarFormatter: NumberFormatter = {
       let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.currencyCode = "USD"
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}
