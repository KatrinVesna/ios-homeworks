//
//  UITabBarController.swift
//  Navigation
//
//  Created by Екатерина Александренко on 23.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let feedView = FeedViewController()
    let profileView = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupControllers()
    }

    private func setupControllers() {
        
        let feedNavigationController = UINavigationController(rootViewController: feedView)
        let profileNavigationController = UINavigationController(rootViewController: profileView)
        
        feedView.tabBarItem.title = "Feed"
        feedView.tabBarItem.image = UIImage(systemName: "house.fill")
        feedView.navigationItem.title = "Feed"
        
        profileView.tabBarItem.title = "Profile"
        profileView.tabBarItem.image = UIImage(systemName: "person.fill")
        profileView.navigationItem.title = "Profile"
        
        viewControllers = [feedNavigationController, profileNavigationController]
        
    }
}
