class CharacterListViewControllerFactory {
    static private let serviceLocator = RickandMortyServiceLocator()
    
    static func makeCharacterListViewController() -> CharactersListViewController {
        let presenter = CharacterListPresenter(
            getCharacterListUseCase: serviceLocator.getCharacterListUseCase
            
        )
        let characterListViewController = CharactersListViewController(
            viewDataSource: CharacterListDataSource(),
            viewDelegate: CharacterListDelegate(),
            presenter: presenter
        )
        presenter.view = characterListViewController
        return characterListViewController
    }
}
