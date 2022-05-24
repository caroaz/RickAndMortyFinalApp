

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        let restApiCall = APICallRickAndMorty()
        let repository = CharacterListAPIRepository(restApi: restApiCall, errorMapper: APIErrorToDomainError())
        let useCaseCharacterList = GetCharacterList(characterListRepository: repository)
        let characterListViewController = CharactersListViewController()
    
        characterListViewController.useCase = useCaseCharacterList
        
        let navigationController = UINavigationController(rootViewController: characterListViewController)
                window?.rootViewController = navigationController
                
        return true
    }
   


}

