//
//  ValueView.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import SwiftUI

struct ValueView: View {
    
    @EnvironmentObject var itemViewModel: SharedItemViewModel
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 4) {
            HStack(alignment: .center, spacing: 0) {
                Text(itemViewModel.displayValue,
                     format: .currency(code: "USD").precision(.fractionLength(2))
                )
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(itemViewModel.valueModifier.rawValue)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            HStack(alignment: .center, spacing: 0) {
                Text(itemViewModel.percentChange >= 0.0 ? "+" : "")
                    .font(.caption)
                    .foregroundStyle(itemViewModel.percentChange >= 0.0 ? Color.green : Color.red)
                Text(itemViewModel.percentChange,
                    format: .percent.precision(.fractionLength(2))
                )
                    .font(.caption)
                    .foregroundStyle(itemViewModel.percentChange >= 0.0 ? Color.green : Color.red)
            }
        }
        .padding(.trailing, 24)
    }
}

#Preview {
    ValueView()
        .environmentObject(SharedItemViewModel(
            shortName: "Market Cap",
            longName: "Global Market Capitalization",
            value: 1717000000000,
            percentChange: 0.0041)
        )
}
