
import Foundation
class CharacterListAPIRepository: CharactersRepository {
    
    private let restApi: APIRest
    private let errorMapper: Mapper<DomainError, APIError>
    
    init(restApi: APIRest, errorMapper: Mapper<DomainError, APIError> ) {
        self.restApi = restApi
        self.errorMapper = errorMapper
        
    }
    
    func fetchCharactersList(onCompletion: @escaping (Result<[Characters], DomainError>) -> Void) {
        restApi.fetchData { characters, error in
            if let characters = characters {
                let list = characters
                onCompletion(.success(list))
            }
            else {
                onCompletion(.failure(DomainError(description: "Error")))
            }
        }
    }
}
