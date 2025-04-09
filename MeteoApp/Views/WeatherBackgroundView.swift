import SwiftUI

struct WeatherBackgroundView: View {
    var condition: String
    
    var gradient: LinearGradient {
        switch condition {
        case "Clear":
            return LinearGradient(colors: [Color.blue, Color.cyan], startPoint: .top, endPoint: .bottom)
        case "Rain":
            return LinearGradient(colors: [Color.gray, Color.blue.opacity(0.5)], startPoint: .top, endPoint: .bottom)
        case "Clouds":
            return LinearGradient(colors: [Color.gray, Color.white], startPoint: .top, endPoint: .bottom)
        default:
            return LinearGradient(colors: [Color.blue, Color.white], startPoint: .top, endPoint: .bottom)
        }
    }
    
    var body: some View {
        Rectangle()
            .fill(gradient)
            .edgesIgnoringSafeArea(.all)
            .animation(.easeInOut(duration: 1.5), value: condition)
    }
}
