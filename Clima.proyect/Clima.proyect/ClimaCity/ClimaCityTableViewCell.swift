import UIKit

class ClimaCityTableViewCell: UITableViewCell {

    @IBOutlet weak var LabelDia: UILabel!
    @IBOutlet weak var ImageClima: UIImageView!
    @IBOutlet weak var GradoAlto: UILabel!
    @IBOutlet weak var GradoBajo: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configure(with item: PronosticoDia) {
        LabelDia.text = item.dia
        GradoAlto.text = "\(item.max)°"
        GradoBajo.text = "\(item.min)°"
        ImageClima.image = UIImage(systemName: item.icono)
    }
}
