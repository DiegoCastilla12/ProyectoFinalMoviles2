//
//  UICollectionView+Styiling.swift
//  Clima.proyect
//
//  Created by Suite on 23/12/25.
//

import Foundation
import UIKit


extension UICollectionView {
    func applyCollectionStyle() {
        self.backgroundColor = UIColor.white.withAlphaComponent(0.5) 
        self.showsHorizontalScrollIndicator = false
        self.layer.cornerRadius = 8.0
        self.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 4.0
    }
}

