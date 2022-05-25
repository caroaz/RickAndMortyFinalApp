import UIKit

class CharacterDetailViewController: UIViewController{
    
    var dataContent : Characters?
    var tableDetailView = UITableView ()
    
    private var viewDataSource: CharacterDetailDataSource?
    private var viewDelegate: CharacterDetailDelegate?
    
    
    convenience init(
        viewDataSource: CharacterDetailDataSource,
        viewDelegate: CharacterDetailDelegate
    ) {
        self.init()
        self.viewDataSource = viewDataSource
        self.viewDelegate = viewDelegate
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureTableView()
        
    }
    
    func configureTableView() {
        view.addSubview(tableDetailView)
        
        setTableViewDelegates()
        tableDetailView.rowHeight = 280
        tableDetailView.register(CellCharacterDetails.self, forCellReuseIdentifier: "imageCell")
        tableDetailView.register(CellCharacterDetails.self, forCellReuseIdentifier: "dataCell")
        tableDetailView.pin(to :view)
    }
    
    
    func setTableViewDelegates(){
        tableDetailView.delegate = viewDelegate
        viewDelegate?.view = self
        tableDetailView.dataSource = viewDataSource
        viewDataSource?.view = self
        
    }
    
}


