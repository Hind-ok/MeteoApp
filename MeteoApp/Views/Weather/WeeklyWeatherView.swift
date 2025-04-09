import SwiftUI

struct WeeklyWeatherView: View {
    var dailyWeather: [DailyWeather]
    
    var body: some View {
        VStack {
            ForEach(dailyWeather, id: \.date) { weather in
                HStack {
                    Text(weather.date.formattedDay)
                    Spacer()
                    Text("\(weather.minTemperature.formattedTemperature)°C - \(weather.maxTemperature.formattedTemperature)°C")
                    Spacer()
                    Image(systemName: weather.icon.weatherIcon)
                }
                .padding()
            }
        }
    }
}
