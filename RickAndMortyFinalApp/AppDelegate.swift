

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
     
        let presenter = CharacterListPresenter(getCharacterListUseCase: RickandMortyServiceLocator().getCharacterListUseCase)
        let characterListViewController = CharactersListViewController(presenter: presenter)
    
        presenter.view = characterListViewController
        
        let navigationController = UINavigationController(rootViewController: characterListViewController)
                window?.rootViewController = navigationController
                
        return true
    }
   


}

