//
//  ApiServiceTests.swift
//  WeatherRepoPackageTests
//
//  Created by Marcelo Mogrovejo on 02/01/2024.
//

import XCTest
@testable import WeatherRepoPackage

final class ApiServiceTests: XCTestCase {

    private var remoteRepo: RemoteRepositoryMock?

    override func setUpWithError() throws {
        remoteRepo = RemoteRepositoryMock()
    }

    override func tearDownWithError() throws {
        remoteRepo = nil
    }

    func testWeather_onSuccess() async {
        // Arrange
        remoteRepo?.weatherSuccess = true
        let returnWeather = getFakeWeather()
        remoteRepo?.weatherReturnData = returnWeather

        // Act
        do {
            let weather = try await remoteRepo?.weather(latitude: -31.969148090946256, longitude: 115.81716949880371)
            // Assert
            XCTAssertEqual(remoteRepo?.isWeatherCalled, true)
            XCTAssertEqual(remoteRepo?.numberOfTimesIsCalledWeather, 1)
            if let weather = weather {
                XCTAssertEqual(returnWeather.name, weather.name)
            }
        } catch {
        }
    }

    func testWeather_onFailure() async {
        // Arrange
        remoteRepo?.weatherSuccess = false

        // Act
        do {
            let _ = try await remoteRepo?.weather(latitude: -31.969148090946256, longitude: 115.81716949880371)
        } catch {
            // Assert
            XCTAssertNotNil(error)
        }
    }

}

extension ApiServiceTests {

    // MARK: - Mock data
    private func getFakeWeather() -> WeatherDto {
        let coord = Coord(lon: 115.8172, lat: -31.9691)
        let weather = Weather(id: 803,
                              main: "Clouds",
                              description: "broken clouds",
                              icon: "04n")
        let main = Main(temp: 286.32,
                        feelsLike: 285.86,
                        tempMin: 284.29,
                        tempMax: 287.77,
                        pressure: 1031,
                        seaLevel: 83,
                        grndLevel: 1031,
                        humidity: 1029)
        let wind = Wind(speed: 0,
                        deg: 0,
                        gust: 0)
        let clouds = Clouds(all: 75)
        let sys = Sys(type: 2,
                      id: 63154,
                      country: "AU",
                      sunrise: 1725661568,
                      sunset: 1725703427)
        return WeatherDto(coord: coord,
                          weather: [weather],
                          base: "stations",
                          main: main,
                          visibility: 10000,
                          wind: wind, 
                          rain: nil,
                          clouds: clouds,
                          dt: 1725716901,
                          sys: sys,
                          timezone: 28800,
                          id: 2078913,
                          name: "Nedlands",
                          cod: 200)
    }
}

