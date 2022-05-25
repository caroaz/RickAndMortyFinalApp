
import Foundation
import UIKit
class CharacterDetailDelegate: NSObject{
    
    weak var view: CharacterDetailViewController?
    
}

extension CharacterDetailDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case .zero:
            return 260
        default:
            return 100
        }
    }
}
