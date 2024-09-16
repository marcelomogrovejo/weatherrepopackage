//
//  WeatherType.swift
//  WeatherRepoPackage
//
//  Created by Marcelo Mogrovejo on 15/09/2024.
//

import Foundation


public enum WeatherType: Int {

    /// Source: https://github.com/open-meteo/open-meteo/issues/287
    ///
    case clear = 0
    case mostlyClear = 1
    case partlyCloudy = 2
    case cloudy = 3
    case fog = 45
    case freezingFog = 48
    case lightDrizzle = 51
    case drizzle = 53
    case heavyDrizzle = 55
    case lightFreezingDrizzle = 56
    case freezingDrizzle = 57
    case lightRain = 61
    case rain = 63
    case heavyRain = 65
    case lightfreezingRain = 66
    case freezingRain = 67
    case lightSnow = 71
    case snow = 73
    case heavySnow = 75
    case snowGrains = 77
    case lightRainShower = 80
    case rainShower = 81
    case heavyRainShower = 82
    case snowShower = 85
    case heavySnowShower = 86
    case thunderstorm = 95
    case hailstorm = 96
    case heavyHailstorm = 99
}
