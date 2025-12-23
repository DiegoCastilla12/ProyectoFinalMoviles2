import UIKit

class ClimaCityViewController: UIViewController {

    @IBOutlet weak var LabelCity: UILabel!
    @IBOutlet weak var ImageCity: UIImageView!
    @IBOutlet weak var LabelPronostico: UILabel!
    @IBOutlet weak var CollectionPronostico: UICollectionView!
    @IBOutlet weak var DiasS: UITableView!
    
    var pronosticoHoras: [PronosticoHora] = []
    var pronosticoDias: [PronosticoDia] = []
    var weatherService: WeatherService!
    var weather: Weather?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()
        
        setupCollectionView()
        mostrarClima()
        
        DiasS.delegate = self
        DiasS.dataSource = self
        let nib = UINib(nibName: "ClimaCityTableViewCell", bundle: nil)
        DiasS.register(nib, forCellReuseIdentifier: "ClimaCityTableViewCell")
        
        weatherService = WeatherService(apiKey: "b1ea92e63bf9ca29e3e379a7386a5d76")
        
        if let city = weather?.city {
            cargarPronosticoHoras(city: city)
            cargarPronosticoDias(city: city)
        }
    }

    private func mostrarClima() {
        guard let weather = weather else { return }
        
        LabelCity.text = weather.city
        LabelPronostico.text = "\(weather.temperature)°C - \(weather.description)"
        ImageCity.image = UIImage(systemName: weather.icon)
    }
    
    private func setupUI() {
      
        view.applyDefaultGradientBackground()
        LabelCity.applyCityLabelStyle()
        LabelPronostico.applyPronosticoLabelStyle()
        ImageCity.applyWeatherIconStyle(systemName: "cloud.sun.fill")
        CollectionPronostico.applyCollectionStyle()
        DiasS.applyTableViewStyle()
        
       
        animateUIElements()
    }

   
    private func animateUIElements() {
        
        UIView.animate(withDuration: 0.8, delay: 0.2, options: .curveEaseInOut, animations: {
            self.LabelCity.alpha = 1.0
            self.LabelPronostico.alpha = 1.0
            self.ImageCity.alpha = 1.0 
        })
    }
}

private extension ClimaCityViewController {
    func setupCollectionView() {
        CollectionPronostico.delegate = self
        CollectionPronostico.dataSource = self
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        CollectionPronostico.register(nib, forCellWithReuseIdentifier: "CollectionCell")
        
        if let layout = CollectionPronostico.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 12
            layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }
        
        CollectionPronostico.showsHorizontalScrollIndicator = false
    }
    
    private func cargarPronosticoHoras(city: String) {
        weatherService.fetchForecastHoras(city: city) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let horas):
                    self?.pronosticoHoras = horas
                    self?.CollectionPronostico.reloadData()
                case .failure(let error):
                    print("Error cargando pronóstico horario: \(error)")
                }
            }
        }
    }
    
    private func cargarPronosticoDias(city: String) {
        weatherService.fetchForecastDiario(city: city) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let dias):
                    self?.pronosticoDias = dias.sorted { $0.date < $1.date }
                    self?.DiasS.reloadData()
                case .failure(let error):
                    print("Error cargando pronóstico diario: \(error)")
                }
            }
        }
    }
}

extension ClimaCityViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        pronosticoHoras.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CollectionCell",
            for: indexPath
        ) as! CollectionViewCell

        let item = pronosticoHoras[indexPath.item]
        cell.configure(with: item)

        return cell
    }
}

extension ClimaCityViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 80, height: 90)
    }
}

extension ClimaCityViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pronosticoDias.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ClimaCityTableViewCell",
            for: indexPath
        ) as! ClimaCityTableViewCell

        let item = pronosticoDias[indexPath.row]
        cell.configure(with: item)
        return cell
    }

    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
