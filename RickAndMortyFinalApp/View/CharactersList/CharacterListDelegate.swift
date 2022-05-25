
import Foundation
import UIKit
class CharacterListDelegate : NSObject{
    
    weak var view: CharactersListViewController?
    
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
        let vcDetail = CharacterDetailViewControllerFactory.makeCharacterDetailViewController()
        vcDetail.dataContent = view.characterList[indexPath.row]
        view.navigationController?.pushViewController(vcDetail, animated: true)
    }
}
