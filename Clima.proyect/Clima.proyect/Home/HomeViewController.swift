import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    let weatherService = WeatherService(apiKey: "b1ea92e63bf9ca29e3e379a7386a5d76")
    let cities = [
        "Lima", "Trujillo", "Arequipa", "Cusco",
        "Piura", "Chiclayo", "Iquitos", "Tacna", "Cajamarca"
    ]
    var selectedWeather: Weather?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        let nib = UINib(nibName: "StartTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "StartCell")
        tableView.rowHeight = 56
        tableView.tableFooterView = UIView()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 16)
    }

    private func setupUI() {
        applyDefaultGradientBackground()
        setupDecorativeIcon()
        setupHeader()
        setupCard()
        setupFooter()
    }

    private func setupDecorativeIcon() {
        let icon = UIImageView(image: UIImage(systemName: "cloud.sun.fill"))
        icon.tintColor = UIColor.white.withAlphaComponent(0.2)
        icon.contentMode = .scaleAspectFit
        icon.frame = CGRect(x: view.bounds.width - 140, y: 90, width: 120, height: 120)
        view.addSubview(icon)
    }

    private func setupHeader() {
        titleLabel.setText("Mi Clima")
        titleLabel.applyTitleStyle()

        subtitleLabel.setText("Selecciona una ciudad para ver el clima")
        subtitleLabel.applySubtitleStyle()
    }

    private func setupCard() {
        cardView.backgroundColor = .white
        cardView.rounded(radius: 22)
        cardView.layer.applySimpleShadow()
    }

    private func setupFooter() {
        footerLabel.setText("Datos de clima · Proyecto académico")
        footerLabel.applyFooterStyle()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StartCell", for: indexPath) as! StartTableViewCell
        let city = cities[indexPath.row]
        cell.configure(city: city)
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityName = cities[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)

        weatherService.fetchWeather(city: cityName) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    self.selectedWeather = weather
                    let vc = ClimaCityViewController(nibName: "ClimaCityViewController", bundle: nil)
                    vc.weather = weather
                    self.navigationController?.pushViewController(vc, animated: true)
                case .failure:
                    let alert = UIAlertController(title: "Error", message: "No se pudo cargar el clima", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
            }
        }
    }
}
