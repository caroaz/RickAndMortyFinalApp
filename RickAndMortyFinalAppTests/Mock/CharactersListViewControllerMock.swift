
import Foundation
import UIKit
@testable import RickAndMortyFinalApp
 class CharactersListViewControllerMock: CharactersListViewController {
     var viewDataSourceMock: CharacterListDataSource?
     var viewDelegateMock: CharacterListDelegate?
     
     let characterListTableMock = UITableView()
     
     override func viewDidLoad() {
         characterListTableMock.dataSource = viewDataSourceMock
         characterListTableMock.delegate = viewDelegateMock
         
         prepareTableView()
     }
     
     private func prepareTableView() {
         view.addSubview(characterListTableMock)
         characterListTableMock.pin(to: view)
         characterListTableMock.register(CellCharactersList.self, forCellReuseIdentifier: "cell")
         title = "Rick and Morty"
     }
 }

