import Foundation

struct ForecastResponse: Decodable {
    let list: [ForecastItem]
}

struct ForecastItem: Decodable {
    let dt: TimeInterval
    let main: Main
    let weather: [WeatherInfo]
}

extension ForecastResponse {
    func toPronosticoHoras() -> [PronosticoHora] {
        list.map { item in
            let date = Date(timeIntervalSince1970: item.dt)
            let formatter = DateFormatter()
            formatter.dateFormat = "ha"
            let horaString = formatter.string(from: date)
            
            let icono: String
            switch item.weather.first?.main.lowercased() ?? "" {
            case "clear": icono = "sun.max.fill"
            case "clouds": icono = "cloud.fill"
            case "rain": icono = "cloud.rain.fill"
            default: icono = "cloud.sun.fill"
            }

            return PronosticoHora(
                hora: horaString,
                temperatura: Int(item.main.temp),
                icono: icono
            )
        }
    }
}

extension ForecastResponse {
    func toPronosticoDias() -> [PronosticoDia] {

        let calendar = Calendar.current

        let grouped = Dictionary(grouping: list) { item -> Date in
            let date = Date(timeIntervalSince1970: item.dt)
            return calendar.startOfDay(for: date)
        }

        var pronosticosDias: [PronosticoDia] = []

        for (date, items) in grouped {

            let maxTemp = items.map { $0.main.temp }.max() ?? 0
            let minTemp = items.map { $0.main.temp }.min() ?? 0

            let firstWeather = items.first?.weather.first?.main.lowercased() ?? ""
            let icono: String
            switch firstWeather {
            case "clear": icono = "sun.max.fill"
            case "clouds": icono = "cloud.fill"
            case "rain": icono = "cloud.rain.fill"
            default: icono = "cloud.sun.fill"
            }

            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "es_ES")
            formatter.timeZone = .current
            formatter.dateFormat = "EEEE"
            let dia = formatter.string(from: date)

            pronosticosDias.append(
                PronosticoDia(
                    date: date,
                    dia: dia.capitalized,
                    icono: icono,
                    max: Int(maxTemp),
                    min: Int(minTemp)
                )
            )
        }

        return pronosticosDias.sorted { $0.date < $1.date }
    }
}


