//
//  File.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import Foundation

enum ValueModifier: String {
    case trillion = "T"
    case billion = "B"
    case million = "M"
    case none = ""
}

@Observable final class SharedItemViewModel: ObservableObject, Identifiable {
    
    let id: String = UUID().uuidString
    var shortName: String
    var longName: String
    var value: Decimal
    var percentChange: Decimal
    var valueModifier: ValueModifier = ValueModifier.none
    
    init(shortName: String, longName: String, value: Decimal, percentChange: Decimal) {
        self.shortName = shortName
        self.longName = longName
        self.value = value
        self.percentChange = percentChange
    }
    
    private let trillion: Decimal = 1000000000000
    private let billion: Decimal = 1000000000

    var displayValue: Decimal {
        var adjustedValue = value / trillion
        if adjustedValue > 1.0 {
            valueModifier = ValueModifier.trillion
            return adjustedValue
        }
        
        adjustedValue = value / billion
        if adjustedValue > 1.0 {
            valueModifier = ValueModifier.billion
            return adjustedValue
        }
        
        valueModifier = ValueModifier.none
        return value
    }
    
    func update(value: Decimal, percentChange: Decimal) {
        self.value = value
        self.percentChange = percentChange
    }

}
