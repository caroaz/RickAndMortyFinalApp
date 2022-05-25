
import Foundation
import UIKit
class CharacterListDelegate : NSObject{
    
    weak var view: CharacterListView?
    
}

extension CharacterListDelegate: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let view = view else {
            return 0
        }
        if  view.shouldCellBeExpanded && view.selectedIndex == indexPath {return 200}
        
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let view = view else {
            return
        }
        
        let cellContent =  view.characterList[indexPath.row]
        view.showNextVIewController(name: cellContent)
    }
}
