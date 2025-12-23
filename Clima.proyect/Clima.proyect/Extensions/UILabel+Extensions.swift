//
//  UILabel+Extensions.swift
//  Clima.proyect
//
//  Created by DAMII on 19/12/25.
//

import UIKit

extension UILabel {
    
    func setText(_ text: String) {
        self.text = text
    }
    
    func setFont(size: CGFloat, weight: UIFont.Weight = .regular) {
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
    }
    
    func setTextColor(_ color: UIColor) {
        self.textColor = color
    }
    
    func applyTitleStyle() {
        setFont(size: 25, weight: .bold)
        setTextColor(.white)
        textAlignment = .center
    }
    
        func applySubtitleStyle() {
            setFont(size: 20)
            setTextColor(UIColor.white.withAlphaComponent(0.9))
            
            textAlignment = .center
            numberOfLines = 0
            
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 1, height: 1)
            layer.shadowOpacity = 0.2
            layer.shadowRadius = 2
            
            let letterSpacing: CGFloat = 1.2
            let attributes: [NSAttributedString.Key: Any] = [
                .kern: letterSpacing
            ]
            let attributedString = NSAttributedString(string: text ?? "", attributes: attributes)
            self.attributedText = attributedString
            
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = 0.3
            layer.shadowRadius = 4
        }
    

    
    func applyFooterStyle() {
        setFont(size: 12)
        setTextColor(UIColor.white.withAlphaComponent(0.85))
        textAlignment = .center
    }

        func applyCityLabelStyle() {
            self.applyTitleStyle()
            self.textColor = .white
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            self.layer.shadowOpacity = 0.8
            self.layer.shadowRadius = 4.0
            self.layer.masksToBounds = true
            self.layer.cornerRadius = 8.0
        }

        func applyPronosticoLabelStyle() {
            self.applySubtitleStyle()
            self.textAlignment = .center
            self.font = UIFont.boldSystemFont(ofSize: 20)
            self.textColor = UIColor.white.withAlphaComponent(0.9)
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            self.layer.shadowOpacity = 0.7
            self.layer.shadowRadius = 4.0
            self.layer.masksToBounds = true
            self.layer.cornerRadius = 8.0
        }
    }


