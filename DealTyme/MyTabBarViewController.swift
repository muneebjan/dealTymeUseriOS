//
//  TabBarViewController.swift
//  DealTyme
//
//  Created by Ali Apple on 31/01/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import UIKit

class MyTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(r:38, g:168, b:52)], for:.selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(r:195, g:197, b:199)], for:.normal)
        self.navigationItem.setHidesBackButton(true, animated: false)
        let dealsViewController = DealsViewController()
        dealsViewController.tabBarItem.title = "Deals"
        dealsViewController.tabBarItem.selectedImage = UIImage(named: "fireGreen")?.withRenderingMode(.alwaysOriginal)
        dealsViewController.tabBarItem.image = UIImage(named: "fireGray")?.withRenderingMode(.alwaysOriginal)

        let savedDealsViewController = SavedDealsViewController()
        savedDealsViewController.tabBarItem.title = "Save"
        savedDealsViewController.tabBarItem.selectedImage = UIImage(named: "savedGreen")?.withRenderingMode(.alwaysOriginal)
        savedDealsViewController.tabBarItem.image = UIImage(named: "savedGray")?.withRenderingMode(.alwaysOriginal)

        let accountViewControllers = AccountViewController()
        accountViewControllers.tabBarItem.title = "Account"
        accountViewControllers.tabBarItem.selectedImage = UIImage(named: "profileGreen")?.withRenderingMode(.alwaysOriginal)
        accountViewControllers.tabBarItem.image = UIImage(named: "profileGray")?.withRenderingMode(.alwaysOriginal)

        let viewControllerList = [ dealsViewController, savedDealsViewController, accountViewControllers ]
        viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
