import UIKit

extension UIView {

    func rounded(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }

    func applyDefaultGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.06, green: 0.77, blue: 0.82, alpha: 1).cgColor,
            UIColor(red: 0.00, green: 0.48, blue: 0.75, alpha: 1).cgColor
        ]
        gradientLayer.frame = self.bounds
        gradientLayer.zPosition = -1 

        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
