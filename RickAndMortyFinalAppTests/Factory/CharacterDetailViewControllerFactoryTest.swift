
import Foundation
@testable import RickAndMortyFinalApp
import XCTest


class CharacterDetailViewControllerFactoryTest: XCTestCase{
    
    
        var sut: CharacterDetailViewControllerFactory!
        
        override func setUp() {
            super.setUp()
            sut = CharacterDetailViewControllerFactory()

        }
        
        
        override func tearDown() {
            sut = nil
            super.tearDown()
        }
        
        func testFactory() {
            let vc = CharacterDetailViewControllerFactory.makeCharacterDetailViewController()
            XCTAssertTrue((vc as Any) is CharacterDetailViewController)
        }
  
}
