
import Foundation
import UIKit

class CharacterDetailDataSource: NSObject {
    weak var view: CharacterDetailViewController?
}

extension CharacterDetailDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let view = view else{
            return UITableViewCell()
        }
        switch indexPath.row{
        case .zero:
            let mycell = view.tableDetailView.dequeueReusableCell(withIdentifier: "imageCell") as! CellCharacterDetails
            
            mycell.results = view.dataContent
            
            return mycell
        case 1:
            return prepareDataCell(view.tableDetailView, key: "Name:", content: "  \(view.dataContent?.name ?? "ok")")
            
        case 2:
            return prepareDataCell(view.tableDetailView, key: "Status:", content: "  \(view.dataContent?.status ?? "ok")")
        case 3:
            return prepareDataCell(view.tableDetailView, key: "Gender:", content: "  \(view.dataContent?.gender ?? "ok")")
            
        default:
            return UITableViewCell()
        }
        
    }
    
    private func prepareDataCell(_ tableView: UITableView, key: String, content: String) -> CellCharacterDetailsContent{
        let mylabelcell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! CellCharacterDetailsContent
        
        mylabelcell.results = view?.dataContent
        mylabelcell.contentLabel.attributedText = NSMutableAttributedString()
            .bold(key)
            .normal(content)
        return mylabelcell
    }
    
}
