//
//  WeatherData.swift
//  Clima
//
//  Created by Jean Oliveira Miranda on 06/07/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//


struct WeatherData: Codable {
    let name:String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
