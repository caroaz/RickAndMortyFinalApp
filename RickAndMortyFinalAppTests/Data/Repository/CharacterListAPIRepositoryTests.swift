
import Foundation
import XCTest
@testable import RickAndMortyFinalApp

class DogApiRepositoryTests: XCTestCase {
    var sut : CharacterListAPIRepository!
    var restApi : ApiRestMock!
    
    override func setUp(){
        super.setUp()
        
        restApi = ApiRestMock()
        //        restApi.shloudFaile = true
        
        let mapper =  APIErrorToDomainError()
        
        sut = CharacterListAPIRepository(restApi: restApi, errorMapper: mapper)
    }
    override func tearDown() {
        sut = nil
        restApi = nil
        super.tearDown()
        
    }
    
    func testSuccessFetchCharacters(){
        
        let expectation = expectation(description: "TestSuccess")
        
        sut.fetchCharactersList { result in
            print(result)
            switch  result {
            case .success(let characters):
                XCTAssertNotNil(characters)
            case .failure:
                XCTFail("asd")
                
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testFailureFetchCharacters(){
        restApi.shouldFail = true
        let expectation = expectation(description: "TestFailure")
        
        sut.fetchCharactersList { result in
            print(result)
            switch  result {
            case .success:
                XCTFail("error de test")
            case .failure(let error):
                XCTAssertNotNil(error)
                
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
}
