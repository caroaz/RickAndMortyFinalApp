
import Foundation
import UIKit
class CellCharactersList: UITableViewCell {
    private var prepared = false
    
    private var nameLabel = UILabel()
    private var statusLabel = UILabel()
    private var characterImageView = UIImageView()
    private var container = UIView ()
    var myButton = UIButton()
    
    var shouldCellBeExpanded : Bool = false
    
    
    var results: Characters?{
        didSet {
            guard let results =  results else {return}
            self.nameLabel.text = results.name
            self.statusLabel.text = results.status
            
            let url = URL(string: results.image)
            
            self.characterImageView.downloaded(from: url!)
        }
        
    }
    
    func prepare(){
        if !prepared{
            
            contentView.addSubview(container)
            containerConf()
            configureNameLabel()
            setNameLabelConstraint()
            containerConstraint ()
            configureImageView()
            setImageConstraint()
            setNameLabelConstraint()
            setStatusLabelConstraint()
            confstatusLabel()
            mybuttonConfig()
            myButtonConstraint()
            prepared = true
            //                characterImageView.image = UIImage(named: "placeholder")
        }
    }
    private func containerConf(){
        container.addSubview(characterImageView)
        container.addSubview(nameLabel)
        
        container.addSubview(myButton)
        container.addSubview(statusLabel)
        container.clipsToBounds = true
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = UIImage(named: "placeholder")
        
    }
    
    func animated () {
        UIView.animate(withDuration: 0.5, delay: 0.3,  usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseIn, animations:{
            self.contentView.layoutIfNeeded()
        })
    }
    
    
    
    private func configureImageView () {
        characterImageView.layer.cornerRadius = 10
        characterImageView.clipsToBounds = true
    }
    
    private func configureNameLabel(){
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    private func confstatusLabel(){
        statusLabel.numberOfLines = 0
        statusLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func mybuttonConfig() {
        myButton.configuration = .gray()
        myButton.configuration?.title = "Status"
        
    }
    //
    
    private func setImageConstraint(){
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: container.topAnchor),
            
            characterImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12),
            characterImageView.heightAnchor.constraint(equalToConstant: 80),
            characterImageView.widthAnchor.constraint(equalTo:  characterImageView.heightAnchor,multiplier: 16/9)
            
        ])
    }
    //
    private  func setNameLabelConstraint(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: container.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,constant: 20),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            nameLabel.trailingAnchor.constraint(equalTo:  container.trailingAnchor, constant: -12)
            
        ])
    }
    
    private func containerConstraint (){
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    private func setStatusLabelConstraint(){
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,constant: 20),
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 140)
            
        ])
    }
    private func myButtonConstraint(){
        myButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myButton.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,constant: 20),
            myButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            myButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
}

