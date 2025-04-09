import Foundation

struct HourlyWeather: Codable {
    var time: Date
    var temperature: Double
    var icon: Weather.Icon
}
