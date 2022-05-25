

import Foundation
 
class CharacterDetailViewControllerFactory {
    static private let serviceLocator = RickandMortyServiceLocator()
    
    static func makeCharacterDetailViewController() -> CharacterDetailViewController {
      
        let characterDetailViewController = CharacterDetailViewController(
            viewDataSource: CharacterDetailDataSource(),
            viewDelegate: CharacterDetailDelegate()
          
        )
       
        
        return characterDetailViewController
    }
}

