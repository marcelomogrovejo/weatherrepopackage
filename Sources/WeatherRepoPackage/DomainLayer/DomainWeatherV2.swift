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
    // Current.apparentTemperature
    public let feelLike: Double
    // Current.relativeHumidity2M
    public let humidity: Int
    // Current.windSpeed10M
    public let windSpeed: Double
    public let hourlyWeatherTime: [String]
    public let hourlyWeatherCode: [Double]
    public let hourlyWeatherTemperature: [Double]
    public let weatherCode: Int
    public let isDay: Bool
//    public let desc: String?
//    public let iconName: String?
    public let minTemperature: Double
    public let maxTemperature: Double
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
                feelLike: Double,
                humidity: Int,
                windSpeed: Double,
                hourlyWeatherTime: [String],
                hourlyWeatherCode: [Double],
                hourlyWeatherTemperature: [Double],
                weatherCode: Int,
                isDay: Bool,
                minTemperature: Double,
                maxTemperature: Double,
                sunrise: String,
                sunset: String) {
        self.latitude = latitude
        self.longitude = longitude
        self.temperature = temperature
        self.feelLike = feelLike
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.hourlyWeatherTime = hourlyWeatherTime
        self.hourlyWeatherCode = hourlyWeatherCode
        self.hourlyWeatherTemperature = hourlyWeatherTemperature
        self.weatherCode = weatherCode
        self.isDay = isDay
        self.minTemperature = minTemperature
        self.maxTemperature = maxTemperature
        self.sunrise = sunrise
        self.sunset = sunset
    }
}
