//
//  MainTabBarViewController.swift
//  GoGoAnime
//
//  Created by Makwana Bhavin on 27/05/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = HomeViewController()
        let vc2 = SearchViewController()
        let vc3 = LibraryViewController()
        
        vc1.title = "Home"
//        vc2.title = "Search"
        vc3.title = "Library"
        
        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .never
        vc3.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        
        nav2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        nav2.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.tintColor = .label
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 2)
        nav1.navigationBar.prefersLargeTitles = true
        nav1.navigationBar.tintColor = .label
        nav3.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "square.stack.fill"), tag: 3)
        nav3.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.tintColor = .label

        
        setViewControllers([nav1, nav2, nav3], animated: true)
        
    }
    

    


}
