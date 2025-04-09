import SwiftUI

struct CityRow: View {
    @ObservedObject var city: City

    var body: some View {
        NavigationLink(destination: CityWeatherView(city: city)) {
            HStack(alignment: .firstTextBaseline) {
                Text(city.name)
                    .lineLimit(1)
                    .font(.title)
                Spacer()
                HStack {
                    Image(systemName: city.weather?.weather.first?.icon ?? "questionmark.circle")
                        .foregroundColor(.gray)
                        .font(.title)
                    Text("\(city.weather?.main.temp ?? 0, specifier: "%.1f")°C")
                        .foregroundColor(.gray)
                        .font(.title)
                }
            }
            .padding([.trailing, .top, .bottom])
        }
    }
}
