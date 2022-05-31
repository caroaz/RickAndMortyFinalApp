
import Foundation
import UIKit

class CellCharacterDetails: UITableViewCell {
    
    var characterImageView = UIImageView()
    var contentLabel = UILabel()
    private var prepared = false
    
    var results: Characters?{
        didSet {
            prepare()
            setImage()
        }
        
    }
    
    func prepare() {
        if !prepared{
            
            contentView.addSubview(characterImageView)
            
            configureImageView()
            setImageConstraint()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = UIImage(named: "placeholder")
        
        
    }
    
    func setImage(){
        let url = URL(string: results?.image ?? "placeholder")
        characterImageView.downloaded(from: url ?? URL(fileURLWithPath: "image") )
        
    }
    func configureImageView () {
        characterImageView.layer.cornerRadius = 10
        characterImageView.clipsToBounds = true
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
    
}
