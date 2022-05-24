
import Foundation
protocol CharacterListView: AnyObject {
    func displayList(_ list: [Characters])
    func displayError(_ error: DomainError)
}
