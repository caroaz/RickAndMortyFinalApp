import Foundation
import UIKit
import UiModuleLib

class CharacterListDataSource: NSObject {
    weak var view: CharacterListView?
}

extension CharacterListDataSource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return view?.characterList.count ?? 0
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let view = view else{
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "1") as! Cell
        let results = view.characterList[indexPath.row]
        cell.prepare()
        cell.set(image: results.image, name: results.name, status: results.status)
        
        cell.myButton.tag = indexPath.row
        cell.myButton.addTarget(self, action: #selector(clickButton(_:)), for: .touchUpInside)
        //        let cell = tableView.dequeueReusableCell(withIdentifier:"characterListCell", for: indexPath as IndexPath) as! CellCharactersList
        //
        //        cell.results =  view.characterList[indexPath.row]
        //        cell.selectionStyle = .none
        //
        //        cell.prepare()
        //        cell.myButton.tag = indexPath.row
        //        cell.myButton.addTarget(self, action: #selector(clickButton(_:)), for: .touchUpInside)
        
        return cell
        
    }
    
    @objc func clickButton(_ sender:UIButton) {
        guard let view = view else {
            return
        }
        let index = sender.tag
        view.shouldCellBeExpanded.toggle()
        
        let indexPath = IndexPath(item: index, section: 0)
        
        view.selectedIndex = indexPath
        
        view.tableView.beginUpdates()
        view.tableView.reloadRows(at: [indexPath], with: .automatic)
        view.tableView.endUpdates()
        
    }
}
