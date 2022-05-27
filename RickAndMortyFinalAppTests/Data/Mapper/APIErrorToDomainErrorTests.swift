
import Foundation
import XCTest
@testable import RickAndMortyFinalApp

class BreedListToArrayMapperTests: XCTestCase {
    var sut: APIErrorToDomainError!
    
    
    override func setUp() {
        super.setUp()
        
        sut = APIErrorToDomainError()
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    func testListMapper (){
        
        let entity = APIError(message: "error de prueba")
        let expectedModel = DomainError(description: "error de prueba")
        let model = sut.reverseMap(value: entity)
        
        XCTAssertEqual(expectedModel.description, model.description)
    }
    
}
