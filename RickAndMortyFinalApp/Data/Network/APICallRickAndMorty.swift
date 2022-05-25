
import Foundation
class APICallRickAndMorty: APIRest {
    
    
    private let urlSession : URLSession
    init (session: URLSession = URLSession.shared){
        urlSession = session
    }
    
    func fetchData(onCompletion: @escaping (Result< [Characters], APIError>) -> Void) {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let task = urlSession.dataTask(with: url){
            
            (data, response, error ) in
            guard let data = data else {
                onCompletion(.failure(APIError(message: "")))
                return}
            guard  let characterList = try? JSONDecoder().decode(CharacterList.self, from: data) else {
                onCompletion(.failure(APIError(message: "")))
                return
            }
            onCompletion(.success(characterList.results))
        }
        task.resume()
    }
}
