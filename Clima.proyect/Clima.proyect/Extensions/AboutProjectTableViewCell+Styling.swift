import UIKit

extension AboutProjectTableViewCell {
    func applyCellStyle() {
        cardView.layer.cornerRadius = 16
        cardView.backgroundColor = UIColor.white.withAlphaComponent(0.15)

        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center

        contentLabel.font = .systemFont(ofSize: 15)
        contentLabel.textColor = UIColor.white.withAlphaComponent(0.95)
        contentLabel.numberOfLines = 0
    }
}
