//
//  PrimaryNameView.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import SwiftUI

struct ShortNameView: View {
    
    @EnvironmentObject var itemViewModel: SharedItemViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            Image(systemName: itemViewModel.percentChange >= 0.0 ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(itemViewModel.percentChange >= 0.0 ? Color.green : Color.red)
            
            Text(itemViewModel.shortName)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primary)
            
            Spacer()

        }
    }
}

#Preview {
    ShortNameView()
        .environmentObject(SharedItemViewModel(
            shortName: "Market Cap",
            longName: "Global Market Capitalization",
            value: 1717000000000,
            percentChange: 0.0041)
        )
}
