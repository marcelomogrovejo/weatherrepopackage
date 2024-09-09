//
//  WeatherDto.swift
//  WeatherRepoPackage
//
//  Created by Marcelo Mogrovejo on 07/09/2024.
//

/// Source: https://app.quicktype.io/
///
import Foundation

struct WeatherDto: Codable {
    let coord: Coord
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let rain: Rain?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let timezone, id: Int?
    let name: String
    let cod: Int?
}

struct Coord: Codable {
    let lon, lat: Double
}

struct Weather: Codable {
    let id: Int?
    let main: String
    let description, icon: String?
}

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel: Int?
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

struct Wind: Codable {
    let speed: Double
    let deg: Int?
    let gust: Double?
}

struct Rain: Codable {
    let the1H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

struct Clouds: Codable {
    let all: Int?
}

struct Sys: Codable {
    let type, id: Int?
    let country: String?
    let sunrise, sunset: Int?
}
