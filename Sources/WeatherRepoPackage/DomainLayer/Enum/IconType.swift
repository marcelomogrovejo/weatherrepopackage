//
//  IconType.swift
//  WeatherRepoPackage
//
//  Created by Marcelo Mogrovejo on 14/09/2024.
//

import Foundation

/// Source: https://openweathermap.org/weather-conditions
/// 
enum IconType: String {
    case clearDay = "01d"
    case clearNight = "01n"
    case fewCloudsDay = "02d"
    case fewCloudsNight = "02n"
    case scatteredCloudsDay = "03d"
    case scatteredCloudsNight = "03n"
    case brokenCloudsDay = "04d"
    case brokenCloudsNight = "04n"
    case showerRainDay = "09d"
    case showerRainNight = "09n.png"
    case rainDay = "10d"
    case rainNight = "10n"
    case thunderStormDay = "11d"
    case thunderStormNight = "11n"
    case snowDay = "13d"
    case snowNight = "13n"
    case mistDay = "50d"
    case mistNight = "50n"

    static func getLocalIcon(_ iconName: String) -> String {
        let icon = IconType(rawValue: iconName)
        switch icon {
        case .clearDay: return "sun.max"
        case .clearNight: return "moon"
        case .fewCloudsDay: return "cloud.sun"
        case .fewCloudsNight: return "cloud.moon"
        case .scatteredCloudsDay: return "smoke"
        case .scatteredCloudsNight: return "smoke"
        case .brokenCloudsDay: return "smoke"
        case .brokenCloudsNight: return "smoke"
        case .showerRainDay: return "cloud.sun.rain"
        case .showerRainNight: return "cloud.moon.rain"
        case .rainDay: return "cloud.heavyrain"
        case .rainNight: return "cloud.heavyrain"
        case .thunderStormDay: return "cloud.sun.bolt"
        case .thunderStormNight: return "cloud.moon.bolt"
        case .snowDay: return "snowflake"
        case .snowNight: return "snowflake"
        case .mistDay: return "cloud.fog"
        case .mistNight: return "cloud.fog"
        case .none:
            return "sun.min"
        }
    }
}
