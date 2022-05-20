
import Foundation
//class CharacterListAPIRepository: CharactersRepository {
//
//
//    private let restApi: APIRest
//    
//    
//    init(restApi: APIRest) {
//        self.restApi = restApi
//      
//    }
//    func fetchCharactersList(onCompletion: @escaping ([Characters] , DomainError?) -> Void) {
//        restApi.fetchData { chacters, error in
//            if let chacters = chacters {
//                let list = self.restApi(chacters)
//                onCompletion(list, nil)
//            } else {
//                let domainError = DomainError(description: error?.message ?? "error generico")
//                onCompletion(nil, domainError)
//            }
//        }
//    }
//    }
