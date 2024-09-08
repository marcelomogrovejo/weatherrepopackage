//
//  RemoteRepositoryMock.swift
//  WeatherRepoPackage
//
//  Created by Marcelo Mogrovejo on 02/01/2024.
//

import Foundation
@testable import WeatherRepoPackage

class RemoteRepositoryMock: RepositoryProtocol {

    typealias T = WeatherDto

    private(set) var isWeatherCalled = false
    private(set) var numberOfTimesIsCalledWeather = 0
    var weatherSuccess = true
    var weatherReturnData: WeatherDto?

    func weather(latitude: Double, longitude: Double) async throws -> WeatherDto {
        if weatherSuccess {
            isWeatherCalled = true
            numberOfTimesIsCalledWeather += 1
            return weatherReturnData!
        } else {
            // TODO: -
            throw RepositoryError.notFound
        }
    }

}
