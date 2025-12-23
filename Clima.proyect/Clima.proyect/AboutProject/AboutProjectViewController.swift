import UIKit

class AboutProjectViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var creditsButton: UIButton!

    private let gradientLayer = CAGradientLayer()

    private let aboutData: [(String, String)] = [
        (
            "Sobre el proyecto",
            "Mi Clima es una aplicación iOS desarrollada con UIKit que permite consultar el clima actual de distintas ciudades del Perú utilizando una API real."
        ),
        (
            "Tecnologías utilizadas",
            """
            • UIKit
            • Arquitectura MVC
            • Consumo de API REST
            • URLSession
            • Decodable
            """
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        applyDefaultGradientBackground()
        setupUI()
        setupTableView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    private func setupUI() {
            iconImageView.setSystemImage(name: "info.circle.fill")
            iconImageView.tintColor = .white
            iconImageView.contentMode = .scaleAspectFit

            creditsButton.applyDefaultStyle(title: "Ver créditos")
            creditsButton.addTarget(self, action: #selector(didTapCredits), for: .touchUpInside)
    }

    private func setupTableView() {
        tableView.delegate = self   
        tableView.dataSource = self
        tableView.applyDefaultStyle()

        let nib = UINib(
            nibName: "AboutProjectTableViewCell",
            bundle: nil
        )
        tableView.register(nib, forCellReuseIdentifier: "AboutCell")
    }

    @objc private func didTapCredits() {
        let vc = CreditsViewController(nibName: "CreditsViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension AboutProjectViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        aboutData.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "AboutCell",
            for: indexPath
        ) as! AboutProjectTableViewCell

        let data = aboutData[indexPath.row]
        cell.configure(title: data.0, content: data.1)
        cell.backgroundColor = .clear

        return cell
    }
}
