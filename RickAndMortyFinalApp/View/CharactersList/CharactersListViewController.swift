
import UIKit
class CharactersListViewController: UIViewController {
    
    var characterList :  [Characters] = []
    var tableView = UITableView ()
    var imageLogo : UIImage = UIImage(named: "Rick-And-Morty")!
    var useCase: GetCharacterListUseCase?
    private var presenter: CharacterListPresenterProtocol?
    private var viewDataSource: CharacterListDataSource?
    private var viewDelegate: CharacterListDelegate?
    
    convenience init(
        viewDataSource: CharacterListDataSource,
        viewDelegate: CharacterListDelegate,
        presenter: CharacterListPresenterProtocol
    ) {
        self.init()
        self.viewDataSource = viewDataSource
        self.viewDelegate = viewDelegate
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
        
        tableView.register(CellCharactersList.self, forCellReuseIdentifier: "characterListCell")
        tableView.pin(to :view)
        
    }
    func setTableViewDelegates(){
        tableView.dataSource = viewDataSource
        viewDataSource?.view = self
        tableView.delegate = viewDelegate
        viewDelegate?.view = self
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




