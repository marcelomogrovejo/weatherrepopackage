//
//  RemoteWeatherRepository.swift
//  WeatherRepoPackage
//
//  Created by Marcelo Mogrovejo on 03/09/2024.
//

import Foundation

public class RemoteWeatherRepository: RepositoryProtocol {

    typealias T = WeatherDto

    /// Public initializer.
    public init() {}

    func weather(latitude: Double, longitude: Double) async throws -> WeatherDto {
        /// URL:    https://api.openweathermap.org/data/2.5/weather?lat=-31.969148090946256&lon=115.81716949880371&appid=d7a633b4d8f13ea358bcd95b64e7b6de&units=metric&lang=en

        guard let url = URL(string: Config.baseUrl + "weather") else {
            throw RepositoryError.badURL
        }
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw RepositoryError.badURL
        }
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "lat", value: "\(latitude)"),
          URLQueryItem(name: "lon", value: "\(longitude)"),
          URLQueryItem(name: "appid", value: Config.ApiKey),
          URLQueryItem(name: "units", value: "metric"),
          URLQueryItem(name: "lang", value: "en")
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = ["accept": "application/json"]

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let http = response.http, http.isSuccessful {
                return try JSONDecoder().decode(WeatherDto.self, from: data)
            } else {
                throw RepositoryError.badResponse
            }
        } catch {
            throw error
        }
    }

}
