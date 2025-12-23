import Foundation

struct WeatherResponse: Decodable {
    let name: String?
    let main: Main
    let weather: [WeatherInfo]
}

struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct WeatherInfo: Decodable {
    let main: String
    let description: String
    let icon: String
}
