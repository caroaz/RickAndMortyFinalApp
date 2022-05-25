
import Foundation
import UIKit

class CellCharacterDetails: UITableViewCell {
    
    var characterImageView = UIImageView()
    var contentLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(characterImageView)
        contentView.addSubview(contentLabel)
        
        
        configureImageView()
        confirgureContentLabel ()
        setImageConstraint()
        setContentLabelConstraint ()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func set(results: Characters){
        let url = URL(string: results.image)
        characterImageView.downloaded(from: url!)
        
    }
    func configureImageView () {
        characterImageView.layer.cornerRadius = 10
        characterImageView.clipsToBounds = true
    }
    func confirgureContentLabel () {
        contentLabel.textAlignment = .center
    }
    
    func setImageConstraint(){
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            characterImageView.widthAnchor.constraint(equalToConstant: 200),
            characterImageView.heightAnchor.constraint(equalToConstant:  200)
            
        ])
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
