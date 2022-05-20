
import UIKit
class CharactersListViewController: UIViewController {
    
    var characterList :  [Characters] = []
    var tableView = UITableView ()
    var restapi: APIRest?
    
    struct Cells{
        static let mycell = "my cell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        configureTableView()
        
        restapi?.fetchData { characters, error in
            
            DispatchQueue.main.async {
                guard let characters = characters else {
                    print(error?.message ?? "error")
                    return
                }
                self.characterList = characters
                self.tableView.reloadData()
            }
        }
        
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(CellCharactersList.self, forCellReuseIdentifier: Cells.mycell)
        tableView.pin(to :view)
        
    }
    func setTableViewDelegates(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    
    var selectedIndex = IndexPath(row: 0, section: 0)
    var shouldCellBeExpanded:Bool = false
}


extension CharactersListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if  shouldCellBeExpanded && selectedIndex == indexPath {return 200}
        
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return characterList.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:Cells.mycell, for: indexPath as IndexPath) as! CellCharactersList
        
        cell.results =  characterList[indexPath.row]
        cell.selectionStyle = .none
        cell.miViewController = self
        cell.prepare()
        cell.myButton.tag = indexPath.row
        cell.myButton.addTarget(self, action: #selector(clickButton(_:)), for: .touchUpInside)
        
        return cell
        
        
    }
    
    @objc func clickButton(_ sender:UIButton) {
        let index = sender.tag
        
        shouldCellBeExpanded.toggle()
        
        let indexPath = IndexPath(item: index, section: 0)
        
        selectedIndex = indexPath
        
        self.tableView.beginUpdates()
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        self.tableView.endUpdates()
        
    }
}




//extension ViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath)
//        selectedIndex = indexPath
//        tableView.beginUpdates()
//        tableView.reloadRows(at: [selectedIndex], with: .none)
//        tableView.endUpdates()

        //        let vcDetail = DetailTableView()
        //        vcDetail.dataContent = characterList[indexPath.row]
        //
        //
        //        navigationController?.pushViewController(vcDetail, animated: true)
//    }

//}

