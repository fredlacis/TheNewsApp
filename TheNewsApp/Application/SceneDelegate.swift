//
//  SceneDelegate.swift
//  TheNewsApp
//
//  Created by Frederico Lacis de Carvalho on 24/05/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene),
              let entryPoint = NewsListRouter.start().entryPoint else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController(rootViewController: entryPoint)
        window.rootViewController = navigationController
        
        self.window = window
        window.makeKeyAndVisible()
        
    }

}
