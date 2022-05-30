
import Foundation
import XCTest
@testable import RickAndMortyFinalApp
import Mimic


class AlamofireCallRickAndMortyTests: XCTestCase {
    
    var sut : AlamofireCallRickAndMorty!
    
    override func setUp() {
        Mimic.start()
        sut = AlamofireCallRickAndMorty()
        super.setUp()
    }
    override func tearDown() {
        Mimic.stopAllMimics()
        sut = nil
        super.tearDown()
    }
    
    func testSuccessFetchDataDataAlamofire(){
        let request = request(with: .get, url: "https://rickandmortyapi.com/api/character")
        print(request)
        let body : [String: Any] = [
            
            "results" :  []
        ]
        let response = response(with: body, status: 200)
        
        Mimic.mimic(request: request, response: response)
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
//    func testIncorrectModelFetchApiDataAlamofire(){
//        let request = request(with: .get, url: "https://rickandmortyapi.com/api/character")
//        
//        let body : [String: Any] = [
//            
//            "invalidkey": 1,
//            "xds": "asd",
//            
//        ]
//        let response = response(with: body, status: 200)
//        
//        Mimic.mimic(request: request, response: response)
//        let expectation = expectation(description: "TestSuccess")
//        sut.fetchData { result in
//            print(result)
//            switch  result {
//            case .success:
//                XCTFail()
//            case .failure(let error):
//                XCTAssertNotNil(error)
//                
//            }
//            
//            //            failure(RickAndMortyFinalApp.APIError(message: "errorModel"))
//            expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 2)
//    }
//    
//    func testfetchDataAlamofire(){
//        
//    }
}
