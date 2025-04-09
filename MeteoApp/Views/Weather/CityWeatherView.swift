import SwiftUI

struct CityWeatherView : View {
    
    @ObservedObject var city: City
    
    var body: some View {
        List {
            Section(header: Text("Currently")) {
                CityHeaderView(city: city)
                HStack {
                    Text("Feeling : \(String(format: "%.1f", city.weather?.main.feels_like ?? 0.0))°C")
                    Spacer()
                    Text("Humidity : \(city.weather?.main.humidity ?? 0)%")
                }
                HStack {
                    Text("Pressure : \(city.weather?.main.pressure ?? 0) hPa")
                    Spacer()
                    Text("Wind : \(String(format: "%.1f", city.weather?.wind.speed ?? 0.0)) km/h")
                }
            }
        }
        .navigationBarTitle(Text(city.name))
    }
}
