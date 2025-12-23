import UIKit

class AboutProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        applyCellStyle()
    }

    func configure(title: String, content: String) {
        titleLabel.text = title
        contentLabel.text = content
    }
}
