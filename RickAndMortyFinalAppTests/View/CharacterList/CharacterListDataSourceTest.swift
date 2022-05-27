
import Foundation
import UIKit
import XCTest
@testable import RickAndMortyFinalApp

class CharacterListDataSourceTest: XCTestCase {
    var sut:CharacterListDataSource!
        var viewController: CharactersListViewController!
        var characterListView: CharacterListViewMock!
        
        override func setUp() {
            super.setUp()
            sut = CharacterListDataSource()
            let tableview = UITableView()
            let selectIndex = IndexPath(row: 0, section: 0)
            let shouldCellExpanded = false
            let repository = CharacterRepositoryMock()
            let characterList = [Characters(identifier: 1, name: "rick", status: "alive", species: "human", image: "imagen", gender: "male")  ]
            characterListView = CharacterListViewMock(characterList: characterList, tableView: tableview, selectedIndex: selectIndex, shouldCellBeExpanded: shouldCellExpanded)
//            let serviceLocator = RickandMortyServiceLocator()
            let getCharactersListUseCase = GetCharacterListUseCase(characterListRepository: repository)
            let presenter = CharacterListPresenter(getCharacterListUseCase: getCharactersListUseCase)
            
        
            viewController = CharactersListViewControllerMock(viewDataSource: sut, viewDelegate: CharacterListDelegate(), presenter: presenter)
            presenter.view = characterListView
            sut.view = characterListView
            //viewController.viewDidLoad()
        }
   
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func testCellForRow() {
        let viewController = CharactersListViewController()
        viewController.characterList = [Characters(identifier: 1, name: "", status: "", species: "", image: "image", gender: "asd")]
        sut.view = viewController
        viewController.viewDidLoad()
        let tableview = viewController.view.subviews[0] as! UITableView
        let cell = sut.tableView(tableview, cellForRowAt: IndexPath(row: 0, section: 0)) as! CellCharactersList
        XCTAssertEqual( cell.results?.gender,  "asd")
        
//        XCTAssertTrue(characterListView.showNextViewControllerCalled)
    }
    
    func testCellForRowWhitNilView() {
        let viewController = CharactersListViewController()
        viewController.characterList = [Characters(identifier: 1, name: "", status: "", species: "", image: "image", gender: "asd")]
        sut.view = nil
        viewController.viewDidLoad()
        let tableview = viewController.view.subviews[0] as! UITableView
        let cell = sut.tableView(tableview, cellForRowAt: IndexPath(row: 0, section: 0))
//        print(cell.r)
        XCTAssertTrue((cell as Any) is UITableViewCell)

    }
    
//    func testShowNextViewControllerIsCalledViewNil() {
//        sut.view = nil
//        let tableView = viewController.view.subviews[0] as! UITableView
//        let test = sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
//        print(test)
//        XCTAssertFalse(characterListView.showNextViewControllerCalled)
//    }
//
//    func testheightForRowAtReturn200() {
//
//        let tableview = viewController.view.subviews[0] as! UITableView
//       let resultHeightForRow = sut.tableView(tableview, heightForRowAt: IndexPath(row: 1, section: 1))
////        print(asd)
//        XCTAssertEqual(resultHeightForRow, 200.0)
//    }
//    func testheightForRowAtReturn0() {
//        sut.view = nil
//        let tableview = viewController.view.subviews[0] as! UITableView
//       let asd = sut.tableView(tableview, heightForRowAt: IndexPath(row: 1, section: 1))
//        print(asd)
//        XCTAssertEqual(asd , 0)
//    }
//
}