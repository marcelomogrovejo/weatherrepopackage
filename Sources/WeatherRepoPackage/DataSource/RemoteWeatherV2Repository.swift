//
//  RemoteWeatherV2Repository.swift
//  WeatherRepoPackage
//
//  Created by Marcelo Mogrovejo on 14/09/2024.
//

import Foundation

public class RemoteWeatherV2Repository: WeatherRepositoryProtocol {

    typealias T = WeatherV2Dto

    /// Public initializer.
    public init() {}

    func weather(latitude: Double, longitude: Double) async throws -> WeatherV2Dto {
        // URL: https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,weather_code,wind_speed_10m&hourly=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset&forecast_days=1

        guard let url = URL(string: Config.OpenMeteo.baseUrl + "forecast") else {
            throw RepositoryError.badURL
        }
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw RepositoryError.badURL
        }
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "latitude", value: "\(latitude)"),
          URLQueryItem(name: "longitude", value: "\(longitude)"),
          URLQueryItem(name: "current", value: "temperature_2m,relative_humidity_2m,apparent_temperature,is_day,weather_code,wind_speed_10m"),
          URLQueryItem(name: "hourly", value: "temperature_2m,weather_code"),
          URLQueryItem(name: "daily", value: "weather_code,temperature_2m_max,temperature_2m_min,sunrise,sunset"),
          URLQueryItem(name: "forecast_days", value: "1")
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = ["accept": "application/json"]

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let http = response.http, http.isSuccessful {
                return try JSONDecoder().decode(WeatherV2Dto.self, from: data)
            } else {
                throw RepositoryError.badResponse
            }
        } catch {
            throw error
        }
    }

}
