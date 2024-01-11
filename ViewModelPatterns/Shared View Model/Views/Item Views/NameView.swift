//
//  NameView.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import SwiftUI

struct NameView: View {
    
    @EnvironmentObject var itemViewModel: SharedItemViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ShortNameView()
            Text(itemViewModel.longName)
                .font(.caption)
                .foregroundStyle(Color.gray)
                .lineLimit(1)
        }
    }
}

#Preview {
    NameView()
        .environmentObject(SharedItemViewModel(
            shortName: "Market Cap",
            longName: "Global Market Capitalization  24",
            value: 1717000000000,
            percentChange: 0.0041)
        )
}
