

import Foundation
import Alamofire

protocol APINetwork {
    
    func request (url: String, onCompletion: @escaping (Result<[Characters], APIError>) -> Void)
}
class RMApiNetwork: APINetwork {
    func request(url: String, onCompletion: @escaping (Result<[Characters], APIError>) ->Void) {
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: CharacterList.self) { response in
            if let characterList = response.value{
                onCompletion(.success(characterList.results))
            }else {
                onCompletion(.failure(APIError(message: "Invalid Request")))
            }
        }
    }
    
    
    
}
