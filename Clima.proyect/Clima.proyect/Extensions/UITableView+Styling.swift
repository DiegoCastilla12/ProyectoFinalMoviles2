//
//  UITableView+Styling.swift
//  Clima.proyect
//
//  Created by Suite on 21/12/25.
//

import UIKit

extension UITableView {
    func applyDefaultStyle() {
        self.backgroundColor = .clear
        self.separatorStyle = .none
        self.showsVerticalScrollIndicator = false
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = 140
    }

        func applyTableViewStyle() {
            self.backgroundColor = .clear
            self.separatorStyle = .none
            self.showsVerticalScrollIndicator = false
            self.rowHeight = 80
            self.estimatedRowHeight = UITableView.automaticDimension
            self.layer.cornerRadius = 10.0
            self.layer.masksToBounds = true
        }
    

}
