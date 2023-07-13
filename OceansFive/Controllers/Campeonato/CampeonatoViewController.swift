//
//  CampeonatoViewController.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 05/07/23.
//

import UIKit



class CampeonatoViewController: UIViewController {
    
    let segmentedControlItems = ["Tabela", "Jogos", "Cestinhas"]
    
    lazy var segmentedControl: UISegmentedControl = {
        let vw = UISegmentedControl(items: segmentedControlItems)
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.selectedSegmentIndex = 0
        vw.addTarget(self, action: #selector(changeSelector), for: .valueChanged)
        return vw
    }()
    
    let statsVW: UIView = {
       let view = InfosView(pontos)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tabelaView: InfosView = {
        let view = InfosView(tabelaClassificacao)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var jogosView: UIView = UIView()
    var currentView: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
       
        layoutViews()
        setNavBar()
    }
    
    func setCurrentView(_ section: UIView) {
        currentView.removeFromSuperview()
        currentView = section
        currentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currentView)
        
        NSLayoutConstraint.activate([
            currentView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            currentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            currentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            currentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
    }
    
    func layoutViews() {
        view.addSubview(segmentedControl)
        
        var jogos: [Jogo] = [
//            Jogo(timeA: "LCN", timeB: "LAU", placar: "-- x --", backgroundColor: .red, onClick: {
//                //tela do marcelo aqui
//                let newViewController = SumulaViewController()
//                self.navigationController?.pushViewController(newViewController, animated: true)
//
//            }),
//            Jogo(timeA: "LCN", timeB: "LAU", placar: "57 x 37", backgroundColor: .darkGray, onClick: {
//
//                self.navigationController?.pushViewController(SumulaPreenchidaViewController(), animated: true)
//
//            }),
//            Jogo(timeA: "LCN", timeB: "LAU", placar: "57 x 37", backgroundColor: .black, onClick: {
//                self.navigationController?.pushViewController(SumulaPreenchidaViewController(), animated: true)
//            }),
//            Jogo(timeA: "LCN", timeB: "LAU", placar: "57 x 37", backgroundColor: .orange, onClick: {
//                self.navigationController?.pushViewController(SumulaPreenchidaViewController(), animated: true)
//            }),
        ]
        
        for _ in 1...quantidadeJogosF {
            jogos.append(Jogo(timeA: "Time 1", timeB: "Time 2", placar: "-- x --", backgroundColor: .red, onClick: {
                let newViewController = SumulaPreenchidaViewController()
//                let newViewController = SumulaViewController()
                self.navigationController?.pushViewController(newViewController, animated: true)
            }))
        }

        
        jogosView = JogosView().getView(self, jogos)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
        ])
        setCurrentView(tabelaView)
    }
    
    func setNavBar() {
        //Navbar
        let navbar = navigationController?.navigationBar
        //navbar?.topItem?.title = "Campeonato"
        self.title = "Campeonato"
        navbar?.prefersLargeTitles = true
        navbar?.topItem?.rightBarButtonItem = {
           let btn = UIBarButtonItem()
            btn.image = UIImage(systemName: "list.bullet.circle")
            return btn
        }()
        navbar?.topItem?.backButtonTitle = "Explorar"
        //
    }
     
    @objc func changeSelector() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            setCurrentView(tabelaView)
        case 1:
            setCurrentView(jogosView)
        case 2:
            setCurrentView(statsVW)
            print(listaTimes.count)
            print(quantidadeTimes)
            print(quantidadeJogosF)
            print(quantidadeJogosM)
        default:
            print("out of range segmented control item")
        }
    }
}


