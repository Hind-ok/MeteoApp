import SwiftUI

struct HourlyWeatherView: View {
    var hourlyWeather: [HourlyWeather]
    
    var body: some View {
        VStack {
            ForEach(hourlyWeather, id: \.time) { weather in
                HStack {
                    Text(weather.time.formattedHour)
                    Spacer()
                    Text("\(weather.temperature.formattedTemperature)°C")
                    Spacer()
                    Image(systemName: weather.icon.weatherIcon)
                }
                .padding()
            }
        }
    }
}
