//
//  UIImageView+Extensions.swift
//  Clima.proyect
//
//  Created by DAMII on 19/12/25.
//

import UIKit

extension UIImageView {
    func setSystemImage(name: String) { 
        self.image = UIImage(systemName: name)
    }
    
    func applyIconStyle(systemName: String) {
            self.image = UIImage(systemName: systemName)
            self.tintColor = .white
            self.contentMode = .scaleAspectFit
        }
    
    func applyWeatherIconStyle(systemName: String) {
           self.image = UIImage(systemName: systemName)
           self.tintColor = .white
           self.layer.shadowColor = UIColor.black.cgColor
           self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
           self.layer.shadowOpacity = 0.6
           self.layer.shadowRadius = 4.0
           self.layer.masksToBounds = true
           self.layer.cornerRadius = self.frame.size.width / 2
       }
    
}

