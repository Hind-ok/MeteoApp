import Combine

class CityStore: ObservableObject {
    @Published var cities: [City] = []
    
    init() {
        // ✅ Ajouter la ville par défaut dès la création du store
        let defaultCity = City()
        cities.append(defaultCity)
    }
}

