
class RickandMortyServiceLocator {
    private let restApi = AlamofireCallRickAndMorty()
    private let errorMapper = APIErrorToDomainError()
    
    private var repository: CharacterListAPIRepository {
        return CharacterListAPIRepository(
            restApi: restApi, errorMapper: errorMapper
            
        )
    }
    
    var getCharacterListUseCase: GetCharacterListUseCase {
        return GetCharacterListUseCase(characterListRepository: repository)
    }
    var apiErrorToDomainError: APIErrorToDomainError {
        return APIErrorToDomainError()
    }
    
}
