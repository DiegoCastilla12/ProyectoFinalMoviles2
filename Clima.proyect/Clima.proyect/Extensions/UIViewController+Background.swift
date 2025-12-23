//
//  UIViewController+Background.swift
//  Clima.proyect
//
//  Created by DAMII on 19/12/25.
//

import UIKit

extension UIViewController {    

    func applyDefaultGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.06, green: 0.77, blue: 0.82, alpha: 1).cgColor,
            UIColor(red: 0.00, green: 0.48, blue: 0.75, alpha: 1).cgColor
        ]
        gradientLayer.frame = view.bounds
        gradientLayer.zPosition = -1

        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
