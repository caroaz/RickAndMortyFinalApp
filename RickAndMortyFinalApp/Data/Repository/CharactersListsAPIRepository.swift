
import Foundation
class CharacterListAPIRepository: CharactersRepository {
    
    private let restApi: APIRest

    init(restApi: APIRest) {
        self.restApi = restApi
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
