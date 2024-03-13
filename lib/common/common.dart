import 'package:adv_flutter_weather/flutter_weather_bg.dart';
import 'package:flutter/cupertino.dart';

Size screenSize = WidgetsBinding.instance.window.physicalSize;
double width = screenSize.width;
double height = screenSize.height;

 Widget weatherCondition( text){
  
  switch(text){
    case '01d':
    return const WeatherBg(weatherType: WeatherType.sunny, width: 370, height: 115);
    case '01n':
    return const WeatherBg(weatherType: WeatherType.sunnyNight, width: 370, height: 115);
    case '02d':
    return const WeatherBg(weatherType: WeatherType.cloudy, width: 370, height: 115);
    case '02n':
    return const WeatherBg(weatherType: WeatherType.cloudyNight, width: 370, height: 115);
    case '03d':
    return const WeatherBg(weatherType: WeatherType.overcast, width: 370, height: 115);
    case '03n':
    return const WeatherBg(weatherType: WeatherType.overcast, width: 370, height: 115);
    case '04d':
    return const WeatherBg(weatherType: WeatherType.hazy, width: 370, height: 115);
    case '04n':
    return const WeatherBg(weatherType: WeatherType.hazy, width: 370, height: 115);
    case '09d':
    return const WeatherBg(weatherType: WeatherType.lightRainy, width: 370, height: 115);
    case '09n':
    return const WeatherBg(weatherType: WeatherType.lightRainy, width: 370, height: 115);
    case '10d':
    return const WeatherBg(weatherType: WeatherType.heavyRainy, width: 370, height: 115);
    case '10n':
    return const WeatherBg(weatherType: WeatherType.heavyRainy, width: 370, height: 115);
    case '11d':
    return const WeatherBg(weatherType: WeatherType.storm, width: 370, height: 115);
    case '11n':
    return const WeatherBg(weatherType: WeatherType.storm, width: 370, height: 115);
    case '13d':
    return const WeatherBg(weatherType: WeatherType.middleSnow, width: 370, height: 115);
    case '13n':
    return const WeatherBg(weatherType: WeatherType.middleSnow, width: 370, height: 115);
    case '50d':
    return const WeatherBg(weatherType: WeatherType.foggy, width: 370, height: 115);
    case '50n':
    return const WeatherBg(weatherType: WeatherType.foggy, width: 370, height: 115);
    
    default: return const WeatherBg(weatherType: WeatherType.foggy, width: 370, height: 115);
  }
}

Widget weatherCondition2( text){  
  print(text);
  switch(text){
    case '01d':
    return const WeatherBg(weatherType: WeatherType.sunny, width: 450, height: 1115);
    case '01n':
    return const WeatherBg(weatherType: WeatherType.sunnyNight, width: 450, height: 1115);
    case '02d':
    return const WeatherBg(weatherType: WeatherType.cloudy, width: 450, height: 1115);
    case '02n':
    return const WeatherBg(weatherType: WeatherType.cloudyNight, width: 450, height: 1115);
    case '03d':
    return const WeatherBg(weatherType: WeatherType.overcast, width: 450, height: 1115);
    case '03n':
    return const WeatherBg(weatherType: WeatherType.overcast, width: 450, height: 1115);
    case '04d':
    return const WeatherBg(weatherType: WeatherType.hazy, width: 450, height: 1115);
    case '04n':
    return const WeatherBg(weatherType: WeatherType.hazy, width: 450, height: 1115);
    case '09d':
    return const WeatherBg(weatherType: WeatherType.lightRainy, width: 450, height: 1115);
    case '09n':
    return const WeatherBg(weatherType: WeatherType.lightRainy, width: 450, height: 1115);
    case '10d':
    return const WeatherBg(weatherType: WeatherType.heavyRainy, width: 450, height: 1115);
    case '10n':
    return const WeatherBg(weatherType: WeatherType.heavyRainy, width: 450, height: 1115);
    case '11d':
    return const WeatherBg(weatherType: WeatherType.storm, width: 450, height: 1115);
    case '11n':
    return const WeatherBg(weatherType: WeatherType.storm, width: 450, height: 1115);
    case '13d':
    return const WeatherBg(weatherType: WeatherType.middleSnow, width: 450, height: 1115);
    case '13n':
    return const WeatherBg(weatherType: WeatherType.middleSnow, width: 450, height: 1115);
    case '50d':
    return const WeatherBg(weatherType: WeatherType.foggy, width: 450, height: 1115);
    case '50n':
    return const WeatherBg(weatherType: WeatherType.foggy, width: 450, height: 1115);
    
    default: return const WeatherBg(weatherType: WeatherType.heavyRainy, width: 450, height: 1115);
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

