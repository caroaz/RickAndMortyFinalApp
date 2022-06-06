
import Foundation
import SwiftyRMLib

class RMApiNetwork: APINetwork {
    func request(url: String, onCompletion: @escaping (Result<[Characters], APIError>) ->Void) {
        SwiftyRMLibCall().request(url: url, expectating: CharacterList.self) { result in
            switch result{
            case .success(let result):
                onCompletion(.success(result.results))
            case .failure:
                onCompletion(.failure(APIError(message: "error")))
            }
        
        }

        }
    }
    
//AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: CharacterList.self) { response in
//    if let characterList = response.value{
//        onCompletion(.success(characterList.results))
//    }else {
//        onCompletion(.failure(APIError(message: "Invalid Request")))
////    }
