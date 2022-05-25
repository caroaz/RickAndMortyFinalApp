
import Foundation
import UIKit
protocol CharacterListView: AnyObject {
    func displayList(_ list: [Characters])
    func displayError(_ error: DomainError)
    
    func showNextVIewController(name: Characters)
    
    var characterList: [Characters] { get set }
    var selectedIndex: IndexPath { get set }
    var shouldCellBeExpanded:Bool { get set }
    var tableView: UITableView {get set}
}
