
import Foundation
import XCTest
@testable import RickAndMortyFinalApp

class CharacterListDelegateTest: XCTestCase {
    var sut:CharacterListDelegate!
        var viewController: CharactersListViewController!
        var characterListView: CharacterListViewMock!
        
        override func setUp() {
            super.setUp()
            sut = CharacterListDelegate()
            let tableview = UITableView()
            let selectIndex = IndexPath(row: 1, section: 1)
            let shouldCellExpanded = true
            let repository = CharacterRepositoryMock()
            let characterList = [Characters(identifier: 1, name: "rick", status: "alive", species: "human", image: "imagen", gender: "male")  ]
            characterListView = CharacterListViewMock(characterList: characterList, tableView: tableview, selectedIndex: selectIndex, shouldCellBeExpanded: shouldCellExpanded)
//            let serviceLocator = RickandMortyServiceLocator()
            let getCharactersListUseCase = GetCharacterListUseCase(characterListRepository: repository)
            let presenter = CharacterListPresenter(getCharacterListUseCase: getCharactersListUseCase)
            
        
            viewController = CharactersListViewControllerMock(viewDataSource: CharacterListDataSource(), viewDelegate: sut, presenter: presenter)
            presenter.view = characterListView
            sut.view = characterListView
            //viewController.viewDidLoad()
        }
   
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func testShowNextViewControllerIsCalled() {
        let tableView = viewController.view.subviews[0] as! UITableView
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(characterListView.showNextViewControllerCalled)
    }
    
    func testShowNextViewControllerIsCalledViewNil() {
        sut.view = nil
        let tableView = viewController.view.subviews[0] as! UITableView
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
//        print(test)
        XCTAssertFalse(characterListView.showNextViewControllerCalled)
    }
    
    func testheightForRowAtReturn200() {
   
        let tableview = viewController.view.subviews[0] as! UITableView
       let resultHeightForRow = sut.tableView(tableview, heightForRowAt: IndexPath(row: 1, section: 1))
//        print(asd)
        XCTAssertEqual(resultHeightForRow, 200.0)
    }
    func testheightForRowAtReturn0() {
        sut.view = nil
        let tableview = viewController.view.subviews[0] as! UITableView
       let asd = sut.tableView(tableview, heightForRowAt: IndexPath(row: 1, section: 1))
        print(asd)
        XCTAssertEqual(asd , 0)
    }
    
}
