import UIKit

struct Weather {
    let city: String
    let temperature: Int
    let description: String
    let max: Int
    let min: Int
    let icon: String
}

extension WeatherResponse {

    func toWeather() -> Weather {

        let mappedIcon: String
        let condition = weather.first?.main.lowercased() ?? ""

        switch condition {
        case "clear":
            mappedIcon = "sun.max.fill"
        case "clouds":
            mappedIcon = "cloud.fill"
        case "rain":
            mappedIcon = "cloud.rain.fill"
        default:
            mappedIcon = "cloud.sun.fill"
        }

        return Weather(
            city: name ?? "Sin nombre",
            temperature: Int(main.temp),
            description: weather.first?.description.capitalized ?? "",
            max: Int(main.temp_max),
            min: Int(main.temp_min),
            icon: mappedIcon
        )
    }
}
