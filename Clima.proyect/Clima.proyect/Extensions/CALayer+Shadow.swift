//
//  CALayer+Shadow.swift
//  Clima.proyect
//
//  Created by DAMII on 19/12/25.
//

import UIKit

extension CALayer {

    func applySimpleShadow() {
        shadowColor = UIColor.black.cgColor
        shadowOpacity = 0.12
        shadowOffset = CGSize(width: 0, height: 6)
        shadowRadius = 12
        masksToBounds = false
    }
}
