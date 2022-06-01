
import Foundation
@testable import RickAndMortyFinalApp
import XCTest


class CharacterListViewControllerFactoryTest: XCTestCase{
    
    
    var sut: CharacterListViewControllerFactory!
    
    override func setUp() {
        super.setUp()
        
    }
    
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFactory() {
        let vc = CharacterListViewControllerFactory.makeCharacterListViewController()
        print("\(vc) xxxxxxx")
        XCTAssertTrue((vc as Any) is CharactersListViewController)
    }
    
}
