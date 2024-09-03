//
//  RemoteCryptoRepository.swift
//  CryptoRepoPackage
//
//  Created by Marcelo Mogrovejo on 03/09/2024.
//

import Foundation

public class RemoteCryptoRepository: RepositoryProtocol {

    typealias T = CoinDto

    /// Public initializer.
    public init() {}

    func list() async throws -> [CoinDto] {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets") else {
            throw RepositoryError.badURL
        }
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw RepositoryError.badURL
        }
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "vs_currency", value: "aud"),
          URLQueryItem(name: "order", value: "market_cap_desc"),
          URLQueryItem(name: "per_page", value: "100"),
          URLQueryItem(name: "page", value: "1"),
          URLQueryItem(name: "sparkline", value: "true"),
          URLQueryItem(name: "price_change_percentage", value: "24h"),
          URLQueryItem(name: "locale", value: "en"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = ["accept": "application/json"]

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let http = response.http, http.isSuccessful {
                return try JSONDecoder().decode([CoinDto].self, from: data)
            } else {
                throw RepositoryError.badResponse
            }
        } catch {
            throw error
        }
    }

}
