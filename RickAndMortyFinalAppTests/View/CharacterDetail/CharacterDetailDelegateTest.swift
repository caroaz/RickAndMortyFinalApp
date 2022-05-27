
import Foundation
@testable import RickAndMortyFinalApp
import XCTest

class CharacterDetailDelegateTest: XCTestCase{
    
    var sut:CharacterDetailDelegate!
        var viewController: CharacterDetailViewController!
        var characterListView: CharacterListViewMock!
        
        override func setUp() {
            super.setUp()
            sut = CharacterDetailDelegate()
            viewController = CharacterDetailViewController(viewDataSource: CharacterDetailDataSource(), viewDelegate: sut)
     
            sut.view = viewController
            //viewController.viewDidLoad()
        }
   
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func testheightForRowAtReturn260() {
        let tableView = viewController.view.subviews[0] as! UITableView
        let resultheightForRowAt = sut.tableView(tableView, heightForRowAt: IndexPath(row: 0, section: 0))
//   print (asd)
        XCTAssertEqual(resultheightForRowAt, 260.0)
        
    }
    
    func testheightForRowAtReturn100() {
        let tableView = viewController.view.subviews[0] as! UITableView
        let resultheightForRowAt = sut.tableView(tableView, heightForRowAt: IndexPath(row: 1, section: 0))
        XCTAssertEqual(resultheightForRowAt, 100.0)
        
    }

}
