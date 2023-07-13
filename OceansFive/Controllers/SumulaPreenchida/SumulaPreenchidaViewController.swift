//
//  SumulaPreenchidaViewController.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 04/07/23.
//

import UIKit

class SumulaPreenchidaViewController: UIViewController {
   
    
    let segmentedControlSections = ["Flu", "Fla", "Estatisticas", "Infos"]
    
    lazy var segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: segmentedControlSections)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(changeTab), for: .valueChanged)
        return view
    }()
    
    let playerList: PlayersList = {
        let playerList = PlayersList()
        playerList.translatesAutoresizingMaskIntoConstraints = false
        return playerList
    }()
    
    let estatisticasView: EstatisticaTableView = {
        let eview = EstatisticaTableView()
        eview.backgroundColor = .secondarySystemBackground
        return eview
    }()
    
    let infosView: InfosView = {
        let iview = InfosView(infos)
        iview.translatesAutoresizingMaskIntoConstraints = false
        iview.backgroundColor = .secondarySystemBackground
        return iview
    }()
    
    var currentView: UIView = UIView()
    
      override func viewDidLoad() {
        super.viewDidLoad()
          
          //Navbar
          let navbar = navigationController?.navigationBar
          self.title = "Flu 00 X 00 Fla"
          navbar?.prefersLargeTitles = true
          navbar?.topItem?.rightBarButtonItem = {
             let btn = UIBarButtonItem()
              btn.image = UIImage(systemName: "plus")
              return btn
          }()
          navbar?.topItem?.backButtonTitle = "Jogos"
          //
          
          view.backgroundColor = .systemBackground
          
          
        view.addSubview(segmentedControl)
        currentView = playerList
        view.addSubview(currentView)

        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        insertViewSection(playerList)
          
    }
    
    func insertViewSection(_ targetView: UIView) {
        currentView.removeFromSuperview()
        currentView = targetView
        view.addSubview(currentView)
        currentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            currentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            currentView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            currentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    @objc func changeTab() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            insertViewSection(playerList)
            playerList.loadData(segmentedControl.selectedSegmentIndex)
        case 1:
            insertViewSection(playerList)
            playerList.loadData(segmentedControl.selectedSegmentIndex)
        case 2:
            insertViewSection(estatisticasView)
        case 3:
            insertViewSection(infosView)
        default:
            print("tab out of range")
        }
    }
}


