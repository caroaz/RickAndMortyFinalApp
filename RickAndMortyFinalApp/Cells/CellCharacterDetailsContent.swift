
import Foundation
import UIKit
class CellCharacterDetailsContent: UITableViewCell {
    

    var contentLabel = UILabel()
    private var prepared = false
    
    var results: Characters?{
        didSet {
                        prepare()
        }
    }
    
    func prepare() {

        contentView.addSubview(contentLabel)
        confirgureContentLabel ()
        setContentLabelConstraint ()
        
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//
//    }

    func confirgureContentLabel () {
        contentLabel.textAlignment = .center
    }
    
    func setContentLabelConstraint (){
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            contentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
