//
//  WeatherModel.swift
//  ios.weatherappExtension
//
//  Created by luonghoang on 10/12/2023.
//

struct WeatherData: Codable {
    let main: Main
    let weather: [Weather]
    let name: String
 //   let icon: Icon
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let icon: String
}

