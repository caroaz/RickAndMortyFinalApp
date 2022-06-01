
import Foundation
@testable import RickAndMortyFinalApp

class ApiRestMock : APIRest{
    
    var shouldFail = false
    
    func fetchData(onCompletion: @escaping (Result<[Characters], APIError>) -> Void) {
        if shouldFail {
            onCompletion(.failure(APIError(message: "errorModel in Mock")))
            
        }
        else {
            onCompletion(.success([Characters(identifier: 1, name: "RickMock", status: "Alive", species: "Human", image: "image", gender: "Male")]))
            
        }
    }
    
}
