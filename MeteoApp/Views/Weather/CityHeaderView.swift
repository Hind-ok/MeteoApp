import SwiftUI

struct CityHeaderView: View {
    @ObservedObject var city: City

    var temperature: String {
        guard let temp = city.weather?.main.temp else {
            return "-ºC"
        }
        return "\(String(format: "%.1f", temp))°C"
    }

    var weatherIcon: String {
        city.weather?.weather.first?.icon.weatherIcon ?? "questionmark.circle"
    }

    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            HStack(alignment: .center, spacing: 16) {
                Image(systemName: weatherIcon)
                    .font(.largeTitle)
                Text(temperature)
                    .font(.largeTitle)
            }
            Spacer()
        }
        .frame(height: 110)
    }
}
