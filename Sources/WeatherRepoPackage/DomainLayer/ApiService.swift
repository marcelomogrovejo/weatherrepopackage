//
//  ApiService.swift
//  WeatherRepoPackage
//
//  Created by Marcelo Mogrovejo on 02/12/2023.
//

import Foundation

public protocol ApiServiceProtocol {

    /// Fetch the weather for a location.
    /// 
    /// - Parameters:
    ///   - latitude: the latitude
    ///   - longitude: the longitude
    /// - Returns: the weather data for that location.
    /// - throws: An error.
    /// 
    func getCurrentWeather(latitude: Double, longitude: Double) async throws -> DomainWeather

    /// Save the current location.
    ///
    /// - Parameters:
    ///   - latitude: the latitude
    ///   - longitude: the longitude
    ///
    func saveCurrentLocation(latitude: Double, longitude: Double) async throws

    /// Check if there is a currect location already saved.
    ///
    /// - Returns: a boolean
    ///
    func isCurrentLocationExist() async throws -> Bool

    /// Fetch the location already saved if exist.
    ///
    /// - Returns: latitude and longitude
    ///
    func getCurrentLocation() async throws -> DomainLocation
}

public struct ApiService {

    public let remoteRepository: RemoteWeatherRepository
    public let localRepository: LocalLocationRepository

    public init(remoteRepository: RemoteWeatherRepository = RemoteWeatherRepository(),
                localRepository: LocalLocationRepository = LocalLocationRepository()) {
        self.remoteRepository = remoteRepository
        self.localRepository = localRepository
    }

}

extension ApiService: ApiServiceProtocol {

    public func saveCurrentLocation(latitude: Double, longitude: Double) async throws {
        do {
            let currentLocationDto = LocationDto(latitude: latitude, longitude: longitude)
            try await localRepository.save(location: currentLocationDto)
        } catch {
            throw error
        }
    }

    public func isCurrentLocationExist() async throws -> Bool {
        do {
            return try await localRepository.isLocated()
        } catch {
            return false
        }
    }

    public func getCurrentWeather(latitude: Double, longitude: Double) async throws -> DomainWeather {
        do {
            let weatherDto = try await remoteRepository.weather(latitude: latitude, longitude: longitude)
            return DomainWeather(latitude: weatherDto.coord.lat,
                                 longitude: weatherDto.coord.lon,
                                 weather: weatherDto.weather?[0].main ?? "",
                                 desc: weatherDto.weather?[0].description,
                                 temperature: weatherDto.main?.temp ?? 0.0,
                                 minTemperature: weatherDto.main?.tempMin ?? 0.0,
                                 maxTemperature: weatherDto.main?.tempMax ?? 0.0,
                                 feelLike: weatherDto.main?.feelsLike ?? 0.0,
                                 humidity: weatherDto.main?.humidity ?? 0,
                                 pressure: weatherDto.main?.pressure,
                                 visibility: weatherDto.visibility,
                                 windSpeed: weatherDto.wind?.speed ?? 0.0,
                                 rain1H: weatherDto.rain?.the1H,
                                 clouds: weatherDto.clouds?.all,
                                 countryCode: weatherDto.sys?.country,
                                 cityName: weatherDto.name,
                                 timezone: weatherDto.timezone,
                                 sunrise: weatherDto.sys?.sunrise,
                                 sunset: weatherDto.sys?.sunset)
        } catch {
            throw error
        }
    }

    public func getCurrentLocation() async throws -> DomainLocation {
        do {
            let locationDto = try await localRepository.location()
            return DomainLocation(latitude: locationDto.latitude,
                                  longitude: locationDto.longitude)
        } catch {
            throw error
        }
    }

}
