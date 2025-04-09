import SwiftUI

struct WeeklyWeatherView: View {
    var dailyWeather: [DailyWeather]

    var body: some View {
        List(dailyWeather.prefix(7), id: \.id) { day in
            HStack {
                Text(day.time, style: .date)
                Spacer()
                Image(systemName: day.icon.weatherIcon)
                Text("\(Int(day.minTemperature))°C - \(Int(day.maxTemperature))°C")
            }
        }
    }
}
