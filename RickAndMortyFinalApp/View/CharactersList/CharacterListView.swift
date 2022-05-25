
import Foundation
protocol CharacterListView: AnyObject {
    func displayList(_ list: [Characters])
    func displayError(_ error: DomainError)
    
    func showNextVIewController(name: Characters)
    
    var characterList: [Characters] { get set }
    
}
