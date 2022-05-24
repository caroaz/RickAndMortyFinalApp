

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        let characterListViewController = CharactersListViewController()
    
        characterListViewController.useCase = RickandMortyServiceLocator().getCharacterListUseCase
        
        let navigationController = UINavigationController(rootViewController: characterListViewController)
                window?.rootViewController = navigationController
                
        return true
    }
   


}

