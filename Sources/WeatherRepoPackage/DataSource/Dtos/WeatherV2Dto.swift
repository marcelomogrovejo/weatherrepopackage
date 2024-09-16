//
//  WeatherV2Dto.swift
//  WeatherRepoPackage
//
//  Created by Marcelo Mogrovejo on 14/09/2024.
//

import Foundation

struct WeatherV2Dto: Codable {
    let latitude, longitude: Double
    let generationtimeMS: Double?
    let utcOffsetSeconds: Int?
    let timezone, timezoneAbbreviation: String?
    let elevation: Int?
    let currentUnits: CurrentUnits?
    let current: Current?
    let hourlyUnits: HourlyUnits?
    let hourly: Hourly?
    let dailyUnits: DailyUnits?
    let daily: Daily?

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case generationtimeMS = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case currentUnits = "current_units"
        case current
        case hourlyUnits = "hourly_units"
        case hourly
        case dailyUnits = "daily_units"
        case daily
    }
}

// MARK: - Current
struct Current: Codable {
    let time: String?
    let interval: Int?
    let temperature2M: Double
    let relativeHumidity2M: Int
    let apparentTemperature: Double
    let isDay, weatherCode: Int?
    let windSpeed10M: Double

    enum CodingKeys: String, CodingKey {
        case time, interval
        case temperature2M = "temperature_2m"
        case relativeHumidity2M = "relative_humidity_2m"
        case apparentTemperature = "apparent_temperature"
        case isDay = "is_day"
        case weatherCode = "weather_code"
        case windSpeed10M = "wind_speed_10m"
    }
}

// MARK: - CurrentUnits
struct CurrentUnits: Codable {
    let time, interval, temperature2M, relativeHumidity2M: String?
    let apparentTemperature, isDay, weatherCode, windSpeed10M: String?

    enum CodingKeys: String, CodingKey {
        case time, interval
        case temperature2M = "temperature_2m"
        case relativeHumidity2M = "relative_humidity_2m"
        case apparentTemperature = "apparent_temperature"
        case isDay = "is_day"
        case weatherCode = "weather_code"
        case windSpeed10M = "wind_speed_10m"
    }
}

// MARK: - Daily
struct Daily: Codable {
    let time: [String]?
    let weatherCode: [Int]?
    let temperature2MMax, temperature2MMin: [Double]?
    let sunrise, sunset: [String]?

    enum CodingKeys: String, CodingKey {
        case time
        case weatherCode = "weather_code"
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
        case sunrise
        case sunset
    }
}

// MARK: - DailyUnits
struct DailyUnits: Codable {
    let time, weatherCode, temperature2MMax, temperature2MMin: String?

    enum CodingKeys: String, CodingKey {
        case time
        case weatherCode = "weather_code"
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
    }
}

// MARK: - Hourly
struct Hourly: Codable {
    let time: [String]?
    let weatherCode: [Double]?
    let temperature2M: [Double]?

    enum CodingKeys: String, CodingKey {
        case time
        case weatherCode = "weather_code"
        case temperature2M = "temperature_2m"
    }
}

// MARK: - HourlyUnits
struct HourlyUnits: Codable {
    let time, weatherCode, temperature2M: String?

    enum CodingKeys: String, CodingKey {
        case time
        case weatherCode = "weather_code"
        case temperature2M = "temperature_2m"
    }
}
