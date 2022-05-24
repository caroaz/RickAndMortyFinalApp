
import Foundation
class RickandMortyServiceLocator {
    private let restApi = APICallRickAndMorty()
    private let apierrorToDomainError = APIErrorToDomainError()
 
    
    private var repository: CharacterListAPIRepository {
        return CharacterListAPIRepository(
            restApi: restApi,
            errorMapper : apierrorToDomainError

        )
    }
    
    var getCharacterListUseCase: GetCharacterListUseCase {
        return GetCharacterListUseCase(characterListRepository: repository)
    }
    
   
}
