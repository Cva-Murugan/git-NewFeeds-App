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
                let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "navController") as! NavigationController
                  self.window?.rootViewController = yourVC
                  self.window?.makeKeyAndVisible()
              }
                
   
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    
    func loadBaseController() {
       let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
       guard let window = self.window else { return }
       window.makeKeyAndVisible()
       if UserDefaults.standard.bool(forKey: "logIn_status") == false {
           
           let loginVC: LogInViewController = storyboard.instantiateViewController(withIdentifier: "login") as! LogInViewController
           self.window?.rootViewController = loginVC
       } else {
           let mainVC: HomeViewController = storyboard.instantiateViewController(withIdentifier: "showData") as! HomeViewController
           let navigationHomeVC = UINavigationController(rootViewController: mainVC)
           self.window?.rootViewController = navigationHomeVC
       }
        self.window?.makeKeyAndVisible()
    }

    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

