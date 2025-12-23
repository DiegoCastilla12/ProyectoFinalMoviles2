import Foundation

final class WeatherService {

    private let apiKey: String

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    func fetchWeather(city: String,
                      completion: @escaping (Result<Weather, Error>) -> Void) {

        fetchRaw(urlString:
            "https://api.openweathermap.org/data/2.5/weather?q=\(city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? city)&units=metric&lang=es&appid=\(apiKey)"
        ) { result in
            completion(result.flatMap { data in
                do {
                    let response = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    return .success(response.toWeather())
                } catch {
                    return .failure(error)
                }
            })
        }
    }

    func fetchForecastHoras(city: String,
                            completion: @escaping (Result<[PronosticoHora], Error>) -> Void) {
        fetchForecastRaw(city: city) { result in
            completion(result.map { $0.toPronosticoHoras() })
        }
    }

    func fetchForecastDiario(city: String,
                              completion: @escaping (Result<[PronosticoDia], Error>) -> Void) {
        fetchForecastRaw(city: city) { result in
            completion(result.map { $0.toPronosticoDias() })
        }
    }

    private func fetchForecastRaw(
        city: String,
        completion: @escaping (Result<ForecastResponse, Error>) -> Void
    ) {
        let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? city
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(cityEncoded)&units=metric&lang=es&appid=\(apiKey)"
        
        fetchRaw(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let forecast = try JSONDecoder().decode(ForecastResponse.self, from: data)
                    completion(.success(forecast))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func fetchRaw(urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "URL inválida", code: 0)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "Sin datos", code: 0)))
                return
            }

            completion(.success(data))
        }.resume()
    }
}
