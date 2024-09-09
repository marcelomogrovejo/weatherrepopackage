//
//  LocalLocationRepository.swift
//  WeatherRepoPackage
//
//  Created by Marcelo Mogrovejo on 09/09/2024.
//

import Foundation

public class LocalLocationRepository: LocationRepositoryProtocol {

    typealias T = LocationDto

    let key = "weather-app-current-location"

    /// Public initializer.
    ///
    public init() {}

    func save(location: LocationDto) async throws {
        // UserDefauls just accept things like NSArray, NSDictionary, NSString, NSData, NSNumber, and NSDate NOT custome objects
        do {
            let data = try JSONEncoder().encode(location)
            let key = "\(key)"
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Error: Unable to Encode object (\(error))")
            throw error
        }
    }

    func update(location: LocationDto) async throws {
        // TODO: 
    }

    func isLocated() async throws -> Bool {
        do {
            let _ = try await location()
            return true
        } catch {
            print("Error: Unable to get object (\(error))")
            return false
        }
    }

    func location() async throws -> LocationDto {
        let key = "\(key)"
        if let data = UserDefaults.standard.object(forKey: key) as? Data {
            do {
                let item = try JSONDecoder().decode(LocationDto.self, from: data)
                return item
            } catch {
                print("Error: Unable to Decode object (\(error))")
                throw error
            }
        } else {
            print("Error: Object not found.")
            throw RepositoryError.notFound
        }
    }

}
