//
//  WeatherProvider.swift
//  ios.weatherappExtension
//
//  Created by luonghoang on 10/12/2023.
//

import WidgetKit
import SwiftUI
import CoreLocation

struct WeatherProvider: TimelineProvider {
    typealias Entry = WeatherEntry

    func placeholder(in context: Context) -> WeatherEntry {
        return WeatherEntry(date: Date(), weatherData: WeatherData(main: Main(temp: 20.0), weather: [Weather(description: "Trời nắng", icon: "01d")],name:"Hà Nội"))
    }

    func getSnapshot(in context: Context, completion: @escaping (WeatherEntry) -> ()) {
        let entry = WeatherEntry(date: Date(), weatherData: WeatherData(main: Main(temp: 20.0), weather: [Weather(description: "Trời nắng",icon: "01d")],name:"Hà Nội"))
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> ()) {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()

            guard let currentLocation = locationManager.location else {
                completion(Timeline(entries: [], policy: .atEnd))
                return
            }

            let apiKey = "d89566b7541ecad9d211291d677951ba"
            let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(currentLocation.coordinate.latitude)&lon=\(currentLocation.coordinate.longitude)&appid=\(apiKey)&lang=vi&units=metric"

            // Lay du lieu va tao timline
            fetchWeatherData(urlString: urlString) { weatherData in
                guard let weatherData = weatherData else {
                    completion(Timeline(entries: [], policy: .atEnd))
                    return
                }
                // Update sau 15p
                let entry = WeatherEntry(date: Date(), weatherData: weatherData)
                let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 15, to: Date()) ?? Date()
                let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
                completion(timeline)
                
            }
        } else {
            completion(Timeline(entries: [], policy: .atEnd))
        }
    }

    private func fetchWeatherData(urlString: String, completion: @escaping (WeatherData?) -> Void) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    do {
                        
                        let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
                        completion(decodedData)
                    } catch {
                        print("Error decoding JSON: \(error)")
                        completion(nil)
                    }
                } else if let error = error {
                    print("Error fetching data: \(error)")
                    completion(nil)
                }
            }.resume()
        }
    }
}

