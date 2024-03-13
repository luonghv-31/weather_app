//
//  WeatherEntry.swift
//  ios.weatherappExtension
//
//  Created by luonghoang on 10/12/2023.
//

import WidgetKit
import SwiftUI

struct WeatherEntry: TimelineEntry {
    let date: Date
    let weatherData: WeatherData
}
extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
}


struct WeatherWidgetEntryView : View {
    var entry: WeatherProvider.Entry
    
    var body: some View {
       
        VStack(alignment: .leading) {

            HStack{
                Text("\(entry.weatherData.name)").fontWeight(.medium).foregroundColor(Color.white)
                VStack{
                    Image(systemName: "location.fill").font(.caption).foregroundColor(Color.white)
                }
            }
            
            let roundedTemp = entry.weatherData.main.temp.rounded(.up)
            let delZeroTemp = roundedTemp.truncatingRemainder(dividingBy: 1.0)==0 ? String(format: "%.0f",roundedTemp ):String(format: "%.1f",roundedTemp )
            Text("\(delZeroTemp)°")
                .font(.largeTitle)
                .fontWeight(.light).foregroundColor(Color.white)
            Text("")
            IconView(iconName: entry.weatherData.weather.first?.icon ?? "01d").foregroundColor(Color.white)
            Text("\(entry.weatherData.weather.first?.description.capitalizeFirstLetter() ?? "")").foregroundColor(Color.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .zero, endPoint: .bottomTrailing))
        .padding(.leading, -15.0)
        
    }
}

struct IconView: View {
    var iconName: String

    var body: some View {
        switch iconName {
        case "01d":
            return Image(systemName: "sun.max.fill")
        case "01n":
            return Image(systemName: "moon.stars.fill")
        case "02d":
            return Image(systemName: "cloud.sun.fill")
        case "02n":
            return Image(systemName: "cloud.moon.fill")
        case "03d":
            return Image(systemName: "cloud.fill")
        case "03n":
            return Image(systemName: "cloud.fill")
        case "04d":
            return Image(systemName: "icloud.fill")
        case "04n":
            return Image(systemName: "icloud.fill")
        case "09d":
            return Image(systemName: "cloud.rain.fill")
        case "09n":
            return Image(systemName: "cloud.rain.fill")
        case "10d":
            return Image(systemName: "cloud.sun.rain.fill")
        case "10n":
            return Image(systemName: "cloud.moon.rain.fill")
        case "11d":
            return Image(systemName: "cloud.bolt.rain.fill")
        case "11n":
            return Image(systemName: "cloud.bolt.rain.fill")
        case "13d":
            return Image(systemName: "snow")
        case "13n":
            return Image(systemName: "snow")
        case "50d":
            return Image(systemName: "cloud.fog.fill")
        case "50n":
            return Image(systemName: "cloud.fog.fill")
       
        default:
            return Image(systemName: "questionmark.circle.fill")
        }
        

    }
}

