
import Foundation
import XCTest
import Alamofire
@testable import RickAndMortyFinalApp
import Mimic


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
        
        let expectation = expectation(description: "TestSuccess")
        
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
