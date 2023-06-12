//
//  SceneDelegate.swift
//  Edge
//
//  Created by Novastrid on 07/06/23.
//

import UIKit


class NavigationController: UINavigationController{
    
}


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

//    static var shared = SceneDelegate()
    
    var window: UIWindow?

    deinit{
        NotificationCenter.default.removeObserver(self)
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let isLoggedIn =  UserDefaults.standard.value(forKey: "logIn_status") ?? false

         if isLoggedIn as! Bool {
                  print("User logged in")
                  let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
             let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "mainVc") as! MainViewController
                  self.window?.rootViewController = yourVC
                  self.window?.makeKeyAndVisible()
              }
              else {
                  print("User Not logged in")
                  let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "logInVc") as! LogInViewController
                  self.window?.rootViewController = yourVC
                  self.window?.makeKeyAndVisible()
              }
                
        NotificationCenter.default.addObserver(self, selector: #selector(setLogInASRoot), name: NSNotification.Name("login"), object: nil)
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    

    @objc func setLogInASRoot(){
        print("root changed...................")
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
      let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "navController") as! NavigationController
        self.window?.rootViewController = yourVC
        self.window?.makeKeyAndVisible()
    }
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


    
}

