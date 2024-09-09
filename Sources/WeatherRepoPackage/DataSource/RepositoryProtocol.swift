//
//  RepositoryProtocol.swift
//  WeatherRepoPackage
//
//  Created by Marcelo Mogrovejo on 02/12/2023.
//

import Foundation

protocol WeatherRepositoryProtocol {

    associatedtype T

    /// Fetch the weather for the current coordinates.
    ///
    /// Source: https://openweathermap.org/current
    ///
    func weather(latitude: Double, longitude: Double) async throws -> T
}

protocol LocationRepositoryProtocol {

    associatedtype T

    /// Persists the currenct location.
    ///
    /// - Parameter location: coordinates latitutde and longitude
    ///
    func save(location: T) async throws

    func update(location: T) async throws

    /// Checks if the device is already located.
    ///
    /// - Returns: true if the device is already located or false otherwise
    ///
    func isLocated() async throws -> Bool

    /// Fetch the previous persisted location coordinates.
    ///
    /// - Returns: location coordinates.
    ///
    func location() async throws -> T
}
