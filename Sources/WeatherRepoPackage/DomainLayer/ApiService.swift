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
    func getPersistedCurrentLocation() async throws -> DomainLocation?
}

public protocol ApiServiceV2Protocol {
    
    /// Fetch the weather for a location.
    ///
    /// - Parameters:
    ///   - latitude: the latitude
    ///   - longitude: the longitude
    /// - Returns: the weather data for that location.
    /// - throws: An error.
    ///
    func getCurrentWeatherV2(latitude: Double, longitude: Double) async throws -> DomainWeatherV2
}

public struct ApiService {

    public let remoteRepository: RemoteWeatherRepository
    public let remoteRepoV2: RemoteWeatherV2Repository
    public let localRepository: LocalLocationRepository

    public init(remoteRepository: RemoteWeatherRepository = RemoteWeatherRepository(),
                localRepository: LocalLocationRepository = LocalLocationRepository(),
                remoteRepoV2: RemoteWeatherV2Repository = RemoteWeatherV2Repository()) {
        self.remoteRepository = remoteRepository
        self.remoteRepoV2 = remoteRepoV2
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
                                 iconUrl: IconType.getLocalIcon(weatherDto.weather?[0].icon ?? "10d"),
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

    public func getPersistedCurrentLocation() async throws -> DomainLocation? {
        do {
            guard let locationDto = try await localRepository.location() else {
                return nil
            }
            return DomainLocation(latitude: locationDto.latitude,
                                  longitude: locationDto.longitude)
        } catch {
            throw error
        }
    }

}

extension ApiService: ApiServiceV2Protocol {

    public func getCurrentWeatherV2(latitude: Double, longitude: Double) async throws -> DomainWeatherV2 {
        let weatherV2Dto = try await remoteRepoV2.weather(latitude: latitude, longitude: longitude)
        return DomainWeatherV2(latitude: weatherV2Dto.latitude,
                               longitude: weatherV2Dto.longitude,
                               temperature: weatherV2Dto.current?.temperature2M ?? 0, 
                               temperatureUnit: weatherV2Dto.currentUnits?.temperature2M ?? "°C",
                               feelLike: weatherV2Dto.current?.apparentTemperature ?? 0,
                               feelLikeUnit: weatherV2Dto.currentUnits?.apparentTemperature ?? "°C",
                               humidity: weatherV2Dto.current?.relativeHumidity2M ?? 0,
                               humidityUnit: weatherV2Dto.currentUnits?.relativeHumidity2M ?? "%",
                               windSpeed: weatherV2Dto.current?.windSpeed10M ?? 0,
                               windSpeedUnit: weatherV2Dto.currentUnits?.windSpeed10M ?? "km/h",
                               hourlyWeatherTimes: weatherV2Dto.hourly?.time ?? [],
                               hourlyWeatherCodes: weatherV2Dto.hourly?.weatherCode ?? [],
                               hourlyWeatherTemperatures: weatherV2Dto.hourly?.temperature2M ?? [],
                               hourlyWeatherTemperatureUnit: weatherV2Dto.hourlyUnits?.temperature2M ?? "°C",
                               weatherCode: weatherV2Dto.current?.weatherCode ?? 0,
                               isDay: /*weatherV2Dto.current?.isDay == 1 ? true :*/ false,
                               minTemperature: weatherV2Dto.daily?.temperature2MMin?.first ?? 0,
                               minTemperatureUnit: weatherV2Dto.dailyUnits?.temperature2MMin ?? "°C",
                               maxTemperature: weatherV2Dto.daily?.temperature2MMax?.first ?? 0,
                               maxTemperatureUnit: weatherV2Dto.dailyUnits?.temperature2MMax ?? "°C",
                               sunrise: weatherV2Dto.daily?.sunrise?.first ?? "",
                               sunset: weatherV2Dto.daily?.sunset?.first ?? "")

    }

}
