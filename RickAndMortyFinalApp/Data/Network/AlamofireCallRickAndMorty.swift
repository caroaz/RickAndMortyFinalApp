

import Foundation
import Alamofire

class AlamofireCallRickAndMorty: APIRest {
    private let statusOk = 200...299
    
    func fetchData(onCompletion: @escaping (Result<[Characters], APIError>) -> Void) {
        let url = "https://rickandmortyapi.com/api/character"
        
        AF.request(url, method: .get).validate(statusCode: statusOk).responseDecodable(of: CharacterList.self) { response in
            if let characterList = response.value{
                onCompletion(.success(characterList.results))
            }else {
                onCompletion(.failure(APIError(message: "Invalid Request")))
            }
        }
    }
    
}
