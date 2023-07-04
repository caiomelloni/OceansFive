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
        let meusCampeonatosVC = UINavigationController(rootViewController: SumulaViewController())
        let perfilVC = UINavigationController(rootViewController: PerfilViewController())

        explorarVC.tabBarItem.image = UIImage(systemName: "trophy.fill")
        explorarVC.tabBarItem.selectedImage = UIImage(systemName: "trophy.fill")?.withTintColor(PaleteColor.primary, renderingMode: .alwaysOriginal)
        explorarVC.tabBarItem.title = "Explorar"
        explorarVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: PaleteColor.primary], for:.selected)
        
        meusCampeonatosVC.tabBarItem.image = UIImage(systemName: "basketball.fill")
        meusCampeonatosVC.tabBarItem.selectedImage = UIImage(systemName: "basketball.fill")?.withTintColor(PaleteColor.primary, renderingMode: .alwaysOriginal)
        meusCampeonatosVC.tabBarItem.title = "Meus Campeonatos"
        meusCampeonatosVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: PaleteColor.primary], for:.selected)
        
        perfilVC.tabBarItem.image = UIImage(systemName: "person.fill")
        perfilVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")?.withTintColor(PaleteColor.primary, renderingMode: .alwaysOriginal)
        perfilVC.tabBarItem.title = "Perfil"
        perfilVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: PaleteColor.primary], for:.selected)

        setViewControllers([explorarVC, meusCampeonatosVC, perfilVC], animated: true)
    }


}

