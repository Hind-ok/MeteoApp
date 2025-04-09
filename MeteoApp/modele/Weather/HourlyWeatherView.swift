import SwiftUI

struct HourlyWeatherView: View {
    var hourlyWeather: [HourlyWeather]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(hourlyWeather.prefix(12), id: \.id) { hour in
                    VStack {
                        Text(hour.time, style: .time)
                        Image(systemName: hour.icon.weatherIcon)
                        Text("\(Int(hour.temperature))°C")
                    }
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}
