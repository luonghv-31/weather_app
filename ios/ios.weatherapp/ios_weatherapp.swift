//
//  ios_weatherapp.swift
//  ios.weatherapp
//
//  Created by luonghoang on 10/12/2023.
//

import WidgetKit
import SwiftUI
import Intents

@main
struct WeatherWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "WeatherWidget", provider: WeatherProvider()) { entry in
            WeatherWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Dự báo")
        .description("Xem thời tiết ở vị trí mà bạn đang ở")
    }
    
}


