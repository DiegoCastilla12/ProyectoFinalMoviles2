//
//  CollectionViewCell.swift
//  Clima.proyect
//
//  Created by DAMII on 19/12/25.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var LabelHora: UILabel!
    
    @IBOutlet weak var ImageClima: UIImageView!
    
    @IBOutlet weak var LabelGrados: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(with item: PronosticoHora) {
           LabelHora.text = item.hora
           LabelGrados.text = "\(item.temperatura)°"
           ImageClima.image = UIImage(systemName: item.icono)
       }

}
