//
//  SceneDelegate.swift
//  Climat
//
//  Created by Pavel Kostin on 27.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = MainController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

