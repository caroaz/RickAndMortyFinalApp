
import Foundation

import UIKit
import XCTest
@testable import RickAndMortyFinalApp

class CharacterDetailDataSourceTest: XCTestCase {
    var sut:CharacterDetailDataSource!
        var viewController: CharacterDetailViewController!
//        var characterListView: CharacterListViewMock!
        
        override func setUp() {
            super.setUp()
            sut = CharacterDetailDataSource()
       
            let indexpath = IndexPath(row: 0, section: 0)
        
            viewController = CharacterDetailViewController(viewDataSource: sut, viewDelegate: CharacterDetailDelegate())
//            presenter.view = characterListView
            sut.view = viewController
            //viewController.viewDidLoad()
        }
   
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func testCellForRowCase1 (){
        let view = CharacterDetailViewController()
        view.dataContent = Characters(identifier: 1, name: "rickMock", status: "alive", species: "human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "male")
        sut.view = viewController
        viewController.viewDidLoad()
        
        let indexpath = IndexPath(row: 1, section: 0)
        let tableview = viewController.view.subviews[0] as! UITableView
        let cell = sut.tableView(tableview, cellForRowAt: indexpath) as! CellCharacterDetails
        cell.characterImageView.downloaded(from: (view.dataContent?.image)!)

            XCTAssertTrue((cell as Any) is CellCharacterDetails)
 
    }
    func testCellForRowCase2(){
        let view = CharacterDetailViewController()
        view.dataContent = Characters(identifier: 1, name: "rickMock", status: "alive", species: "human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "male")
        sut.view = viewController
        viewController.viewDidLoad()
        
        let indexpath = IndexPath(row: 0, section: 0)
        let tableview = viewController.view.subviews[0] as! UITableView
        let cell = sut.tableView(tableview, cellForRowAt: indexpath) as! CellCharacterDetails
        cell.characterImageView.downloaded(from: (view.dataContent?.image)!)

            XCTAssertTrue((cell as Any) is CellCharacterDetails)
 
    }
    func testCellForRowCase3 (){
        let view = CharacterDetailViewController()
        view.dataContent = Characters(identifier: 1, name: "rickMock", status: "alive", species: "human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "male")
        sut.view = viewController
        viewController.viewDidLoad()
        
        let indexpath = IndexPath(row: 3, section: 0)
        let tableview = viewController.view.subviews[0] as! UITableView
        let cell = sut.tableView(tableview, cellForRowAt: indexpath) as! CellCharacterDetails
        cell.characterImageView.downloaded(from: (view.dataContent?.image)!)

            XCTAssertTrue((cell as Any) is CellCharacterDetails)
 
    }
    func testCellForRowCase4 (){
        let view = CharacterDetailViewController()
        view.dataContent = Characters(identifier: 1, name: "rickMock", status: "alive", species: "human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "male")
        sut.view = viewController
        viewController.viewDidLoad()
        
        let indexpath = IndexPath(row: 4, section: 0)
        let tableview = viewController.view.subviews[0] as! UITableView
        let cell = sut.tableView(tableview, cellForRowAt: indexpath) as! UITableViewCell

            XCTAssertTrue((cell as Any) is UITableViewCell)
 
    }
    
    func testCellForRowWhitNilView() {
        let viewController = CharacterDetailViewController()
        viewController.dataContent = Characters(identifier: 1, name: "rick", status: "asd", species: "asd", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "asd")
        sut.view = nil
        viewController.viewDidLoad()
        let tableview = viewController.view.subviews[0] as! UITableView
        let cell = sut.tableView(tableview, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue((cell as Any) is UITableViewCell)

    }
    
    func testNumberofRowsInSection()  {
       let viewController = CharacterDetailViewController()

        viewController.dataContent = Characters(identifier: 1, name: "name", status: "alive", species: "strange", image: "image", gender: "female")
        sut.view = viewController
        let numberOfRow = sut.tableView(UITableView() , numberOfRowsInSection: 0)

        XCTAssertEqual( numberOfRow, 4)
    }
//
//    func testNumberofRowsInSectionWhitNilView(){
//        sut.view = nil
//        let rows = sut.tableView(UITableView() , numberOfRowsInSection: 0)
//        XCTAssertEqual( rows, 0)
//    }
//    func testButton() {
//
//        let button = sut.clickButton(UIButton())
//
//        print(button )
//    }
}
