//
//  MarketSnapshot.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/11/24.
//

import Foundation

struct MarketSnapshot {
    
    let marketCap: Decimal
    let marketCapPercentChange: Decimal
    let volume: Decimal
    let volumePercentChange: Decimal
    
    init(from apiResponse: QuoteResponse) {
        self.marketCap = apiResponse.data.quote.USD.totalMarketCap.decimalValue ?? 0.0
        self.marketCapPercentChange = (apiResponse.data.quote.USD.marketCapChange.decimalValue ?? 0.0) / 100.0
        self.volume = apiResponse.data.quote.USD.totalVolume.decimalValue ?? 0.0
        self.volumePercentChange = (apiResponse.data.quote.USD.volumeChange.decimalValue ?? 0.0) / 100.0
    }
    
}

extension Double {
    var decimalValue: Decimal? {
        let string = "\(self)"
        return Decimal(string: string)
    }
}

