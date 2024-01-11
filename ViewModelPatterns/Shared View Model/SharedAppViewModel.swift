//
//  SharedAppViewModel.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import SwiftUI

@Observable final class SharedAppViewModel: ObservableObject {
    
    var panelTitle: String
    var headerViewModel: SharedHeaderViewModel
    var itemViewModels: [SharedItemViewModel]
    
    init() {
        self.headerViewModel = SharedHeaderViewModel()
        self.panelTitle = "Market Snapshot"
        self.itemViewModels = []
        
        self.itemViewModels.append(SharedItemViewModel(
            shortName: "Market Cap",
            longName: "Global Market Capitalization",
            value: 1717000000000,
            percentChange: 0.0041)
        )
        
        self.itemViewModels.append(SharedItemViewModel(
            shortName: "Trading Volume",
            longName: "Global Trading Volume  last 24h",
            value: 8430000000,
            percentChange: 0.0352)
        )

    }
    
    
    func loadData() async -> Void {
        do {
            let quoteResponse = try await api.latestQuotes()
            let marketSnapshot = MarketSnapshot(from: quoteResponse)
            DispatchQueue.main.async {
                withAnimation(.easeInOut) {
                    self.updateItems(from: marketSnapshot)
                    print()
                }
            }
        } catch (let error) {
            print(error)
        }
    }

    func updateItems(from snapshot: MarketSnapshot) {
        
        itemViewModels[0].update(
            value: snapshot.marketCap,
            percentChange: snapshot.marketCapPercentChange / 100.0
        )
        
        itemViewModels[1].update(
            value: snapshot.volume,
            percentChange: snapshot.volumePercentChange / 100.0
        )
        
    }

    
}
