import UIKit

class CreditsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
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
