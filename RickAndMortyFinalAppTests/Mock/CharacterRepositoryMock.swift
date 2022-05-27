
import Foundation
@testable import RickAndMortyFinalApp

class CharacterRepositoryMock : CharactersRepository {
    var shouldFail = false
    
    func fetchCharactersList(onCompletion: @escaping (Result<[Characters], DomainError>) -> Void) {
        if shouldFail {
            onCompletion(.failure(DomainError(description: "ErrorMock")))
            
        }
        else {
            onCompletion( .success([Characters(identifier: 1, name: "RickMock", status: "Alive", species: "Human", image: "image", gender: "Male")]))
            
        }
    }
    
    
//    
//    func fetchDogBreeds(onCompletion: @escaping (BreedsList?, DomainError?) -> Void) {
//        if shouldFail {
//            onCompletion(nil, DomainError(description:  "Error Generico"))
//            
//        }
//        else {
//            onCompletion( BreedsList(message: ["akita"] ), nil)
//            
//        }
//        
//    }
//  
//    
//
//    
}
