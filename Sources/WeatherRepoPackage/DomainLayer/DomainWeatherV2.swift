//
//  DomainWeatherV2.swift
//  WeatherRepoPackage
//
//  Created by Marcelo Mogrovejo on 14/09/2024.
//

import Foundation

public struct DomainWeatherV2 {
    public let latitude: Double
    public let longitude: Double
    // Current.temperature2M
    public let temperature: Double
    public let temperatureUnit: String
    // Current.apparentTemperature
    public let feelLike: Double
    public let feelLikeUnit: String
    // Current.relativeHumidity2M
    public let humidity: Int
    public let humidityUnit: String
    // Current.windSpeed10M
    public let windSpeed: Double
    public let windSpeedUnit: String
    public let hourlyWeatherTimes: [String]
    public let hourlyWeatherCodes: [Int]
    public let hourlyWeatherTemperatures: [Double]
    public let hourlyWeatherTemperatureUnit: String
    public let weatherCode: Int
    public let isDay: Bool
//    public let desc: String?
//    public let iconName: String?
    public let minTemperature: Double
    public let minTemperatureUnit: String
    public let maxTemperature: Double
    public let maxTemperatureUnit: String
//    public let pressure: Int?
//    public let visibility: Int?
//    public let rain1H: Double?
//    public let clouds: Int?
//    public let countryCode: String?
//    public let cityName: String
//    public let timezone: Int?
    public let sunrise: String
    public let sunset: String

    public init(latitude: Double, 
                longitude: Double,
                temperature: Double,
                temperatureUnit: String,
                feelLike: Double,
                feelLikeUnit: String,
                humidity: Int,
                humidityUnit: String,
                windSpeed: Double,
                windSpeedUnit: String,
                hourlyWeatherTimes: [String],
                hourlyWeatherCodes: [Int],
                hourlyWeatherTemperatures: [Double],
                hourlyWeatherTemperatureUnit: String,
                weatherCode: Int,
                isDay: Bool,
                minTemperature: Double,
                minTemperatureUnit: String,
                maxTemperature: Double,
                maxTemperatureUnit: String,
                sunrise: String,
                sunset: String) {
        self.latitude = latitude
        self.longitude = longitude
        self.temperature = temperature
        self.temperatureUnit = temperatureUnit
        self.feelLike = feelLike
        self.feelLikeUnit = feelLikeUnit
        self.humidity = humidity
        self.humidityUnit = humidityUnit
        self.windSpeed = windSpeed
        self.windSpeedUnit = windSpeedUnit
        self.hourlyWeatherTimes = hourlyWeatherTimes
        self.hourlyWeatherCodes = hourlyWeatherCodes
        self.hourlyWeatherTemperatures = hourlyWeatherTemperatures
        self.hourlyWeatherTemperatureUnit = hourlyWeatherTemperatureUnit
        self.weatherCode = weatherCode
        self.isDay = isDay
        self.minTemperature = minTemperature
        self.minTemperatureUnit = minTemperatureUnit
        self.maxTemperature = maxTemperature
        self.maxTemperatureUnit = maxTemperatureUnit
        self.sunrise = sunrise
        self.sunset = sunset
    }
}
