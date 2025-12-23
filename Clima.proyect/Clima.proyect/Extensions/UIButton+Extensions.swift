//
//  UIButton+Extensions.swift
//  Clima.proyect
//
//  Created by DAMII on 19/12/25.
//

import UIKit

extension UIButton {
    
    func setTitleText(title: String) {
        self.setTitle(title, for: .normal)
    }
    
    func setTitleColor(_ color: UIColor) {
        self.setTitleColor(color, for: .normal)
    }
    
    func applyDefaultStyle(title: String) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(.systemBlue, for: .normal)
        self.backgroundColor = .white
        self.rounded(radius: 22)
    }
    
    func applyOutlineStyle(title: String) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .clear
        self.layer.cornerRadius = 22
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.clipsToBounds = true
    }
}
