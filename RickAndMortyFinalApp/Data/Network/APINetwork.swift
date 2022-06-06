
import Foundation
protocol APINetwork {
    
    func request (url: String, onCompletion: @escaping (Result<[Characters], APIError>) -> Void)
}
