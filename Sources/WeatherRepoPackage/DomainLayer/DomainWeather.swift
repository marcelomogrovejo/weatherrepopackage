//
//  DomainWeather.swift
//  WeatherRepoPackage
//
//  Created by Marcelo Mogrovejo on 07/09/2024.
//

import Foundation

public struct DomainWeather {
    public let latitude: Double
    public let longitude: Double
    public let weather: String
    public let desc: String?
    public let iconName: String?
    public let temperature: Double
    public let minTemperature: Double
    public let maxTemperature: Double
    public let feelLike: Double
    public let humidity: Int
    public let pressure: Int?
    public let visibility: Int?
    public let windSpeed: Double
    public let rain1H: Double?
    public let clouds: Int?
    public let countryCode: String?
    public let cityName: String
    public let timezone: Int?
    public let sunrise: Int?
    public let sunset: Int?

    public init(latitude: Double,
                longitude: Double,
                weather: String,
                desc: String?,
                iconUrl: String?,
                temperature: Double,
                minTemperature: Double,
                maxTemperature: Double,
                feelLike: Double,
                humidity: Int,
                pressure: Int?,
                visibility: Int?,
                windSpeed: Double,
                rain1H: Double?,
                clouds: Int?,
                countryCode: String?,
                cityName: String,
                timezone: Int?,
                sunrise: Int?,
                sunset: Int?) {
        self.latitude = latitude
        self.longitude = longitude
        self.weather = weather
        self.desc = desc
        self.iconName = iconUrl
        self.temperature = temperature
        self.minTemperature = minTemperature
        self.maxTemperature = maxTemperature
        self.feelLike = feelLike
        self.humidity = humidity
        self.pressure = pressure
        self.visibility = visibility
        self.windSpeed = windSpeed
        self.rain1H = rain1H
        self.clouds = clouds
        self.countryCode = countryCode
        self.cityName = cityName
        self.timezone = timezone
        self.sunrise = sunrise
        self.sunset = sunset
    }
}
