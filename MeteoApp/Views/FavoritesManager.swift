import Foundation

class FavoritesManager: ObservableObject {
    @Published var favoriteCities: [String] {
        didSet {
            UserDefaults.standard.set(favoriteCities, forKey: "favoriteCities")
        }
    }
    
    init() {
        self.favoriteCities = UserDefaults.standard.stringArray(forKey: "favoriteCities") ?? []
    }
    
    func toggleFavorite(city: String) {
        if favoriteCities.contains(city) {
            favoriteCities.removeAll { $0 == city }
        } else {
            favoriteCities.append(city)
        }
    }
}
