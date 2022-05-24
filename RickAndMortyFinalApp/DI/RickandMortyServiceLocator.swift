
class RickandMortyServiceLocator {
    private let restApi = APICallRickAndMorty()

    private var repository: CharacterListAPIRepository {
        return CharacterListAPIRepository(
            restApi: restApi

        )
    }
    
    var getCharacterListUseCase: GetCharacterListUseCase {
        return GetCharacterListUseCase(characterListRepository: repository)
    }
    
   
}
