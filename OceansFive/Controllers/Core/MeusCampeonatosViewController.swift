//
//  MeusCampeonatosViewController.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 28/06/23.
//

import UIKit

class MeusCampeonatosViewController: UIViewController {

    var criarTorneioVw = Criar_Torneio()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "Meus Campeonatos"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground

//        view.addSubview(criarTorneioVw)
//        NSLayoutConstraint.activate([)

    }
}
