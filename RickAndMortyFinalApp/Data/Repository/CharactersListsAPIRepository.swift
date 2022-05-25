
import Foundation
class CharacterListAPIRepository: CharactersRepository {
    
    private let restApi: APIRest
    private let errorMapper: Mapper<DomainError, APIError>

    init(restApi: APIRest, errorMapper: Mapper<DomainError, APIError> ) {
        self.restApi = restApi
        self.errorMapper = errorMapper
    }
    
    func fetchCharactersList(onCompletion: @escaping (Result<[Characters], DomainError>) -> Void) {
        
        restApi.fetchData{ result in
            
            switch result {
            case .success(let characters):
                onCompletion(.success(characters))
            case .failure(let error):
                
                let domainError = self.errorMapper.reverseMap(value: error)
                onCompletion(.failure(domainError))
            }
            
    }
}
}
