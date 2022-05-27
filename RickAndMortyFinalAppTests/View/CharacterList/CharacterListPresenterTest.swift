
import Foundation
import XCTest
@testable import RickAndMortyFinalApp

class CharacterListPresenterTest: XCTestCase {
    var sut: CharacterListPresenter!
        var charactersListView: CharacterListViewMock!
        var repository: CharacterRepositoryMock!
         
        override func setUp() {
            super.setUp()
            let tableview = UITableView()
            let selectIndex = IndexPath(row: 0, section: 0)
            let shouldCellExpanded = true
            let characters = [Characters(identifier: 1, name: "", status: "", species: "", image: "", gender: "")]
            charactersListView = CharacterListViewMock(characterList: characters, tableView: tableview, selectedIndex: selectIndex, shouldCellBeExpanded: shouldCellExpanded)
            repository = CharacterRepositoryMock()
            let getCharactersListUseCase = GetCharacterListUseCase(characterListRepository: repository)
//            let mapper = APIErrorToDomainError()
            sut = CharacterListPresenter(getCharacterListUseCase: getCharactersListUseCase)
            sut.view = charactersListView
        }
        
        override func tearDown() {
            sut = nil
            charactersListView = nil
            repository = nil
            super.tearDown()
        }
        
        func testGetcharacterListSuccess() {
            sut.getCharacterList()
            XCTAssertTrue(charactersListView.displayListCalled)
            XCTAssertFalse(charactersListView.displayErrorCalled)
        }
        
        func testCharacterListFailure() {
            repository.shouldFail = true
            sut.getCharacterList()
            XCTAssertTrue(charactersListView.displayErrorCalled)
            XCTAssertFalse(charactersListView.displayListCalled)
        }
}
