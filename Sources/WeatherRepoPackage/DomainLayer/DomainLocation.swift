//
//  DomainLocation.swift
//  WeatherRepoPackage
//
//  Created by Marcelo Mogrovejo on 09/09/2024.
//

import Foundation

public struct DomainLocation {
    public let latitude, longitude: Double

    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
