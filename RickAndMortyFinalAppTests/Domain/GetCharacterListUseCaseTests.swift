
import XCTest
@testable import RickAndMortyFinalApp

class GetCharacterListUseCaseTests: XCTestCase {
    
    
    var sut : GetCharacterListUseCase!
    var repository: CharacterRepositoryMock!
    
    override func setUp(){
        super.setUp()
        
        repository = CharacterRepositoryMock()
        sut = GetCharacterListUseCase(characterListRepository: repository)
    }
    
    override func tearDown(){
        super.tearDown()
        
        sut = nil
        repository = nil
    }
    
    func testCharacterListUseCase() {
        let expectation = expectation(description: "TestSuccess")
        
        sut.execute {result in
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
    
    func testFailGetCharacterListUseCase (){
        repository.shouldFail = true
        let expectation = expectation(description: "TestFailure")
        
        sut.execute{result in
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
