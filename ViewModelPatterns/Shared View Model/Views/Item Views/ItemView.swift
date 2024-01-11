//
//  ItemView.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import SwiftUI

struct ItemView: View {
    
    @EnvironmentObject var itemViewModel: SharedItemViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            NameView()
            Spacer()
            ValueView()
        }
        .padding(.leading, 24)
    }
}

#Preview {
    ItemView()
        .environmentObject(SharedItemViewModel(
            shortName: "Market Cap",
            longName: "Global Market Capitalization  24h",
            value: 1717000000000,
            percentChange: 0.0041)
        )
}
