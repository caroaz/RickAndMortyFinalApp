

import Foundation
import Alamofire

class AlamofireCallRickAndMorty: APIRest {
    
    private let network : APINetwork

    
    init (network : APINetwork ){
        self.network = network
    }
    
    func fetchData(onCompletion: @escaping (Result<[Characters], APIError>) -> Void) {
        let url = "https://rickandmortyapi.com/api/character"
        network.request(url: url, onCompletion: onCompletion)
    }
    
}
