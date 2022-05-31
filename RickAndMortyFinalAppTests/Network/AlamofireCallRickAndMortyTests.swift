
import Foundation
import XCTest
import Alamofire
@testable import RickAndMortyFinalApp
import Mimic
import OHHTTPStubs


class AlamofireCallRickAndMortyTests: XCTestCase {
    
    var sut : AlamofireCallRickAndMorty!
    var network: RmApiNetworkMock!
    
    override func setUp() {
//        Mimic.start()
        network = RmApiNetworkMock()
        sut = AlamofireCallRickAndMorty(network: network)
        super.setUp()
    }
    override func tearDown() {
//        Mimic.stopAllMimics()
        sut = nil
        network = nil
        super.tearDown()
    }
    
    func testSuccessFetchDataDataAlamofire(){
//        let request = request(with: .get, url: "https://rickandmortyapi.com/api/character")
//        print(request)
//        let body : [String: Any] = [
//            "results" :  []
//        ]
//        let response = response(with: body, status: 200)
//
//        Mimic.mimic(request: request, response: response)
        let expectation = expectation(description: "TestSuccess")
        
        sut.fetchData {result in
//            print(result)
            switch  result {
            case .success(let charactersList):
                XCTAssertNotNil(charactersList)
            case .failure:
                XCTFail("asd")
                
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testAlamofireFail(){
        network.shouldsucceed = false
        
//        let request = request(with: .get, url: "https://rickandmortyapi.com/api/character")
//        print(request)
//        let body : [String: Any] = [
//
//            "results" :  []
//        ]
//        let response = response(with: body, status: 200)
//
//        Mimic.mimic(request: request, response: response)
        let expectation = expectation(description: "TestSuccess")
        
        
//        sut.statusOk = 1...2
        sut.fetchData { result in
            print("\(result)xxxxxxxxxxxx")
            switch result {
        case .success:
            XCTFail("asd")
        case .failure(let error):
                XCTAssertNotNil(error)
            }
        
                expectation.fulfill()
            }

        wait(for: [expectation], timeout: 2)
        }
    }

class RmApiNetworkMock : APINetwork {
    var shouldsucceed = true
    func request(url: String, onCompletion: @escaping (Result<[Characters], APIError>) -> Void) {
        if shouldsucceed {
            onCompletion(.success([]))
        }else {
            onCompletion(.failure(APIError(message: "")))
        }
    }
    
    
    
}
