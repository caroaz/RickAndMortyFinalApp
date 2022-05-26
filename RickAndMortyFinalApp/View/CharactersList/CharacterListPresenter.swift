
import Foundation
class CharacterListPresenter: CharacterListPresenterProtocol {
    
    private let getCharacterListUseCase: GetCharacterListUseCase
    weak var view: CharacterListView?
    
    init(getCharacterListUseCase: GetCharacterListUseCase) {
        self.getCharacterListUseCase = getCharacterListUseCase
    }
    
    func getCharacterList() {
        getCharacterListUseCase.execute { [weak self] result in
            
            switch result {
            case .success(let characters):
                self?.view?.displayList(characters)
            case .failure(let error):
                self?.view?.displayError(error)
            }
            
            
        }
    }
}
