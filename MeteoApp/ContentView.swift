import SwiftUI

struct ContentView: View {
    @State private var cityName: String = ""
    @State private var cities: [City] = []
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Entrer une ville", text: $cityName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Ajouter la ville") {
                    let newCity = City(name: cityName)
                    cities.append(newCity)
                    cityName = ""
                }
                .padding()
                
                List {
                    ForEach(cities, id: \.name) { city in
                        NavigationLink(destination: CityWeatherView(city: city)) {
                            Text(city.name)
                        }
                    }
                }
            }
            .navigationTitle("Météo")
        }
    }
}
