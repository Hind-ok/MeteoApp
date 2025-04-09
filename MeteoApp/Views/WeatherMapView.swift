import SwiftUI
import MapKit

struct WeatherMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )

    @State private var citiesWeather: [CityWeatherAnnotation] = [
        CityWeatherAnnotation(city: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), temperature: "15°C"),
        CityWeatherAnnotation(city: "Lyon", coordinate: CLLocationCoordinate2D(latitude: 45.764, longitude: 4.8357), temperature: "18°C")
    ]

    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: citiesWeather) { city in
            MapMarker(coordinate: city.coordinate, tint: .blue)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityWeatherAnnotation: Identifiable {
    let id = UUID()
    let city: String
    let coordinate: CLLocationCoordinate2D
    let temperature: String
}
