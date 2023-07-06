//
//  CampeonatoViewController.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 05/07/23.
//

import UIKit

class CampeonatoViewController: UIViewController {
    
    let segmentedControlItems = ["Tabela", "Jogos", "Estatisticas"]
    
    lazy var segmentedControl: UISegmentedControl = {
        let vw = UISegmentedControl(items: segmentedControlItems)
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.selectedSegmentIndex = 0
        vw.addTarget(self, action: #selector(changeSelector), for: .valueChanged)
        return vw
    }()
    
    let tabelaView: InfosView = {
        let view = InfosView(tabelaClassificacao)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        layoutViews()
        setNavBar()
    }
    
    func layoutViews() {
        view.addSubview(segmentedControl)
        view.addSubview(tabelaView)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            tabelaView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            tabelaView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabelaView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabelaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setNavBar() {
        //Navbar
        let navbar = navigationController?.navigationBar
        navbar?.topItem?.title = "Campeonato"
        navbar?.prefersLargeTitles = true
        navbar?.topItem?.rightBarButtonItem = {
           let btn = UIBarButtonItem()
            btn.image = UIImage(systemName: "list.bullet.circle")
            return btn
        }()
        navbar?.topItem?.backButtonTitle = "Meus campeonatos"
        //
    }
    
    @objc func changeSelector() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("0")
        case 1:
            print("1")
        case 2:
            print("2")
        default:
            print("out of range segmented control item")
        }
    }
}
