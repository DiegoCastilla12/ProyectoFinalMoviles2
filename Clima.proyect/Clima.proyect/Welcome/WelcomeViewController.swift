import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        applyDefaultGradientBackground()
        setupUIAttributes()
    }

    private func setupUIAttributes() {
        iconImageView.setSystemImage(name: "cloud.sun.fill")
        iconImageView.tintColor = .white
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.layer.applySimpleShadow()

        titleLabel.setText("Mi Clima")
        titleLabel.applyTitleStyle()

        subtitleLabel.setText("Consulta el clima actual de las ciudades del Perú")
        subtitleLabel.applySubtitleStyle()

        startButton.applyDefaultStyle(title: "Comenzar")
        startButton.layer.applySimpleShadow()
        startButton.addTarget(self, action: #selector(didTapStart), for: .touchUpInside)

        aboutButton.applyOutlineStyle(title: "Sobre el proyecto")
        aboutButton.layer.applySimpleShadow()
        aboutButton.addTarget(self, action: #selector(didTapAbout), for: .touchUpInside)
    }

    @objc private func didTapStart() {
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func didTapAbout() {
        let vc = AboutProjectViewController(nibName: "AboutProjectViewController", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
}
