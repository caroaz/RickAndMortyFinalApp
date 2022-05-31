
import Foundation

import UIKit
import XCTest
@testable import RickAndMortyFinalApp

class CharacterDetailDataSourceTest: XCTestCase {
    var sut:CharacterDetailDataSource!
    var viewController: CharacterDetailViewController!
    
    
    override func setUp() {
        super.setUp()
        sut = CharacterDetailDataSource()

        viewController = CharacterDetailViewController(viewDataSource: sut, viewDelegate: CharacterDetailDelegate())
        sut.view = viewController
 
    }
    
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    func testCellForRowCase0(){
        let view = CharacterDetailViewController()
        view.dataContent = Characters(identifier: 1, name: "rickMock", status: "alive", species: "human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "male")
        sut.view = viewController
        
        let tableview = viewController.view.subviews[0] as! UITableView
        let cell = sut.tableView(tableview, cellForRowAt: IndexPath(row: 0, section: 0)) as! CellCharacterDetails
        
        XCTAssertTrue((cell as Any) is CellCharacterDetails)
        
    }
    func testCellForRowCase1to3(){
        let view = CharacterDetailViewController()
        view.dataContent = Characters(identifier: 1, name: "rickMock", status: "alive", species: "human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "male")
        sut.view = viewController
        
        for row in 1...3{
            let tableview = viewController.view.subviews[0] as! UITableView
            let cell = sut.tableView(tableview, cellForRowAt: IndexPath(row: row, section: 0)) as! CellCharacterDetailsContent
            
            XCTAssertTrue((cell as Any) is CellCharacterDetailsContent)
        }
    }
    
    func testCellForRowCaseDefault(){
        let view = CharacterDetailViewController()
        view.dataContent = Characters(identifier: 1, name: "rickMock", status: "alive", species: "human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "male")
        sut.view = viewController
        viewController.viewDidLoad()
        
        let indexpath = IndexPath(row: 4, section: 0)
        let tableview = viewController.view.subviews[0] as! UITableView
        let cell = sut.tableView(tableview, cellForRowAt: indexpath)
        
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
}
