import UIKit

class StartTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .default

        cityLabel.setFont(size: 18, weight: .medium)
        cityLabel.setTextColor(.darkText)

        iconImageView.tintColor = .systemTeal
        iconImageView.contentMode = .scaleAspectFit
    }

    func configure(city: String) {
        cityLabel.setText(city)

        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        iconImageView.image = UIImage(systemName: "globe.europe.africa", withConfiguration: config)
    }
}
