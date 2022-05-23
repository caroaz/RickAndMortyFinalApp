
import Foundation
class APICallRickAndMorty: APIRest {
    
    
    private let urlSession : URLSession
    init (session: URLSession = URLSession.shared){
        urlSession = session
    }
    
    func fetchData(onCompletion: @escaping ( [Characters]?, APIError?) -> Void) {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let task = urlSession.dataTask(with: url){
            
            (data, response, error ) in
            guard let data = data else {
                onCompletion(nil, APIError(message: "Invalid model"))
                return}
            guard  let characterList = try? JSONDecoder().decode(CharacterList.self, from: data) else {
                onCompletion(nil, APIError(message: "Invalid request"))
                return
            }
            onCompletion(characterList.results, nil)
        }
        task.resume()
    }
}
