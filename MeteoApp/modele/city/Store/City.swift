import SwiftUI
import Combine
import CoreLocation

// 📌 Classe représentant une ville avec météo et image associée
class City: ObservableObject {
    @Published var name: String
    @Published var longitude: Double
    @Published var latitude: Double
    @Published var image: UIImage?
    @Published var weather: Weather?
    
    // ✅ Ville par défaut : Erfoud (Maroc)
    init() {
        self.name = "Erfoud"
        self.longitude = -4.2312
        self.latitude = 31.4346
        self.image = nil
        self.weather = nil
        
        fetchWeather()
    }
    
    // ✅ Initialisation avec une autre ville (recherche automatique des coordonnées)
    init(name: String) {
        self.name = name
        self.longitude = 0.0
        self.latitude = 0.0
        self.image = nil
        self.weather = nil
        
        fetchCoordinates { success in
            if success {
                self.fetchWeather()
            }
        }
    }
    
    // Récupération des coordonnées GPS de la ville
    private func fetchCoordinates(completion: @escaping (Bool) -> Void) {
        CLGeocoder().geocodeAddressString(self.name) { placemarks, error in
            guard let location = placemarks?.first?.location else {
                print("⚠️ Erreur: Impossible de trouver \(self.name). \(error?.localizedDescription ?? "Erreur inconnue")")
                completion(false)
                return
            }
            self.longitude = location.coordinate.longitude
            self.latitude = location.coordinate.latitude
            completion(true)
        }
    }
    
    //  Récupération de la météo
    private func fetchWeather() {
        WeatherManager.getWeather(for: self) { weather in
            DispatchQueue.main.async {
                self.weather = weather
            }
        }
    }
}
