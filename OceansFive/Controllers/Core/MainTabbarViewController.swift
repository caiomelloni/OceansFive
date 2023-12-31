//
//  ViewController.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 28/06/23.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let explorarVC = UINavigationController(rootViewController: ExplorarViewController())
        let meusCampeonatosVC = UINavigationController(rootViewController: MeusCampeonatosViewController())
        let perfilVC = UINavigationController(rootViewController: PerfilViewController())
        
        
        explorarVC.tabBarItem.image = UIImage(systemName: "folder.fill")
        explorarVC.tabBarItem.selectedImage = UIImage(systemName: "folder.fill")?.withTintColor(PaleteColor.primary, renderingMode: .alwaysOriginal)
        
        meusCampeonatosVC.tabBarItem.image = UIImage(systemName: "basketball.fill")
        meusCampeonatosVC.tabBarItem.selectedImage = UIImage(systemName: "basketball.fill")?.withTintColor(PaleteColor.primary, renderingMode: .alwaysOriginal)
        
        perfilVC.tabBarItem.image = UIImage(systemName: "person.fill")
        perfilVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")?.withTintColor(PaleteColor.primary, renderingMode: .alwaysOriginal)
        
        setViewControllers([explorarVC, meusCampeonatosVC, perfilVC], animated: true)
    }


}

