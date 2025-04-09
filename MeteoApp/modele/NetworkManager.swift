//
//  NetworkManager.swift
//  Weather
//
//  Created by Lunabee on 21/06/2019.
//  Adapté pour OpenWeatherMap par Noura
//

import UIKit

class NetworkManager: NSObject {
    
    struct Key {
        
        static let openWeather: String = "f954f8e3af83d502c5d04958b9595146"
        static let googleMaps: String = "" // Si besoin, ajoute ta clé Google Maps
        
    }
    
    struct APIURL {
        
        /// Génère l'URL pour récupérer la météo actuelle en fonction des coordonnées GPS
        static func weatherRequest(longitude: Double, latitude: Double) -> String {
            return "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(NetworkManager.Key.openWeather)&units=metric&lang=fr".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
        
        /// Génère l'URL pour récupérer les prévisions météo sur plusieurs jours
        static func forecastRequest(longitude: Double, latitude: Double) -> String {
            return "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=\(NetworkManager.Key.openWeather)&units=metric&lang=fr".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
        
        static func cityCompletion(for search: String) -> String {
            return "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(search)&types=(cities)&key=\(NetworkManager.Key.googleMaps)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
        
        static func cityData(for placeID: String) -> String {
            return "https://maps.googleapis.com/maps/api/place/details/json?placeid=\(placeID)&key=\(NetworkManager.Key.googleMaps)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
    }
}
