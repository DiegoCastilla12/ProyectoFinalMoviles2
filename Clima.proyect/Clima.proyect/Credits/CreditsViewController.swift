import UIKit

class CreditsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let gradientLayer = CAGradientLayer()

    private let creditsData: [(String, String)] = [
        (
            "Proyecto desarrollado por:",
            """
            Diego Armando Castilla Coba – I202406673
            Bryam Oswaldo Fernandez Jimenez – I202406759
            Alexandra Nina Vera Salinas – I202403432
            Sebastian Isla Lozada – I202408471
            """
        ),
        ("Carrera:", "Computación e Informática"),
        ("Profesor:", "Jhonatan Chavez Chavez"),
        ("Curso:", "Desarrollo de Aplicaciones Móviles II"),
        ("Fuente de datos:", "OpenWeather API")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Créditos"
        applyDefaultGradientBackground()
        setupTableView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false

        let nib = UINib(nibName: "CreditsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CreditsCell")

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }
}

extension CreditsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        creditsData.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "CreditsCell",
            for: indexPath
        ) as! CreditsTableViewCell

        let data = creditsData[indexPath.row]
        cell.configure(title: data.0, content: data.1)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none

        return cell
    }
}

extension CreditsViewController: UITableViewDelegate {}
