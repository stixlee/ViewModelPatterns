//
//  Api+CoinMarketCap+GlobalMetrics.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import Foundation

extension Api {
    
    func latestQuotes() async throws -> QuoteResponse {
        let urlString = "https://pro-api.coinmarketcap.com/v1/global-metrics/quotes/latest"
        guard let  url = URL(string: urlString) else {
            print("DEBUG: invalid URL")
            throw NetworkingError.invalidUrl
        }
        let request = buildRequest(url: url, apiKey: "acee5f7b-6669-4844-851b-6f364492daf7")

        let (data, response) = try await URLSession.shared.data(for: request)
                
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let quoteResponse = try JSONDecoder().decode(QuoteResponse .self, from: data)
            return quoteResponse
        } catch let error {
            print("DEBUG: \(error.localizedDescription)")
            throw NetworkingError.invalidJSON
        }
        
    }
    
}

private extension Api {
    
    func buildRequest(url: URL, apiKey: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.addValue("acee5f7b-6669-4844-851b-6f364492daf7",
                         forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        return request
    }
}


