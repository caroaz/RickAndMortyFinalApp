
import UIKit
class CharactersListViewController: UIViewController {
    
    var characterList :  [Characters] = []
    var tableView = UITableView ()
    var imageLogo : UIImage = UIImage(named: "Rick-And-Morty")!
    var useCase: GetCharacterListUseCase?
    private var presenter: CharacterListPresenterProtocol?
    
    struct Cells{
        static let mycell = "my cell"
    }
    convenience init(
        //            viewDataSource: BreedsListViewDataSource,
        //            viewDelegate: BreedsListViewDelegate,
        presenter: CharacterListPresenterProtocol
    ) {
        self.init()
        //            self.viewDataSource = viewDataSource
        //            self.viewDelegate = viewDelegate
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageLogo()
        view.backgroundColor = .white
        presenter?.getCharacterList()
        configureTableView()
        
    }
    func setImageLogo(){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.contentMode = .scaleAspectFit
        imageView.image = imageLogo
        navigationItem.titleView = imageView
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
extension CharactersListViewController: CharacterListView {
    func displayList(_ list: [Characters]) {
        characterList = list
        tableView.reloadData()
    }
    
    func displayError(_ error: DomainError) {
        print(error.description)
    }
}


extension CharactersListViewController: UITableViewDataSource{
    
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

extension CharactersListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcDetail = CharacterDetailViewController()
        vcDetail.dataContent = characterList[indexPath.row]
        navigationController?.pushViewController(vcDetail, animated: true)
    }
}
