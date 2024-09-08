//
//  RepositoryError.swift
//  WeatherRepoPackage
//
//  Created by Marcelo Mogrovejo on 02/12/2023.
//

import Foundation

public enum RepositoryError: Error {
    case badURL
    case notFound
    case badResponse
    
    // TODO: implement more accurate errors
}
