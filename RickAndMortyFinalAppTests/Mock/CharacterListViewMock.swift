
import Foundation
@testable import RickAndMortyFinalApp
import UIKit

class CharacterListViewMock:CharacterListView{
    
    var displayListCalled = false
    var displayErrorCalled = false
    var showNextViewControllerCalled = false
    
    var tableView: UITableView
    var characterList:  [Characters]
    var selectedIndex: IndexPath
    var shouldCellBeExpanded: Bool
    
    
    init(characterList:  [Characters], tableView: UITableView, selectedIndex: IndexPath, shouldCellBeExpanded: Bool) {
        self.characterList = characterList
        self.tableView = tableView
        self.selectedIndex = selectedIndex
        self.shouldCellBeExpanded = shouldCellBeExpanded
        
        
    }
    
    func displayList(_ list: [Characters]) {
        displayListCalled = true
    }
    
    func displayError(_ error: DomainError) {
        displayErrorCalled = true
    }
    
    func showNextVIewController(name: Characters) {
        showNextViewControllerCalled = true
    }
 
}

