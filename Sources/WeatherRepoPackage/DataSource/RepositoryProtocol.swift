//
//  RepositoryProtocol.swift
//  WeatherRepoPackage
//
//  Created by Marcelo Mogrovejo on 02/12/2023.
//

import Foundation
import Combine

protocol RepositoryProtocol {

    associatedtype T

    /// Fetch the weather for the current coordinates.
    ///
    /// Source: https://openweathermap.org/current
    ///
    func weather(latitude: Double, longitude: Double) async throws -> T
}
