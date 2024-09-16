//
//  Config.swift
//
//
//  Created by Marcelo Mogrovejo on 07/09/2024.
//

import Foundation

/// Source: https://openweathermap.org/current
///
struct Config {
    struct OpenWeather {
        static let baseUrl: String = "https://api.openweathermap.org/data/2.5/"
        static let ApiKey: String = "d7a633b4d8f13ea358bcd95b64e7b6de"
    }

    struct OpenMeteo {
        static let baseUrl: String = "https://api.open-meteo.com/v1/"
    }
}
