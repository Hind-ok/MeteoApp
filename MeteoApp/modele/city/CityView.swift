import SwiftUI

struct CityView: View {
    var city: City
    var hourlyWeather: [HourlyWeather] = []
    var dailyWeather: [DailyWeather] = []

    var body: some View {
        VStack {
            Text(city.name)
                .font(.largeTitle)
                .padding()
            
            // Affichage de la météo actuelle
            if let weather = city.weather {
                VStack {
                    Image(systemName: weather.weather.first?.icon.weatherIcon ?? "questionmark.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("\(Int(weather.main.temp))°C")
                        .font(.title)
                    Text(weather.weather.first?.description.capitalized ?? "N/A")
                        .font(.subheadline)
                }
                .padding()
            } else {
                Text("Chargement de la météo...")
            }

            // Météo horaire
            Text("Prévisions pour les prochaines heures")
                .font(.headline)
                .padding(.top)
            HourlyWeatherView(hourlyWeather: hourlyWeather)

            // Météo hebdomadaire
            Text("Prévisions pour la semaine")
                .font(.headline)
                .padding(.top)
            WeeklyWeatherView(dailyWeather: dailyWeather)

            Spacer()
        }
        .padding()
    }
}

