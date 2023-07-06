//
//  CampeonatoViewController.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 05/07/23.
//

import UIKit

struct Jogo {
    let timeA: String
    let timeB: String
    let placar: String
    let backgroundColor: UIColor
}

let jogos: [Jogo] = [
    Jogo(timeA: "LCN", timeB: "LAU", placar: "-- x --", backgroundColor: .red),
    Jogo(timeA: "LCN", timeB: "LAU", placar: "57 x 37", backgroundColor: .darkGray),
    Jogo(timeA: "LCN", timeB: "LAU", placar: "57 x 37", backgroundColor: .black),
    Jogo(timeA: "LCN", timeB: "LAU", placar: "57 x 37", backgroundColor: .orange),
]

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
    
    let jogosView: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.backgroundColor = .secondarySystemBackground
        
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        vw.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: vw.leadingAnchor, constant: 16),
            scrollView.topAnchor.constraint(equalTo: vw.topAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: vw.trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: vw.bottomAnchor)
        ])
        
        let contentView = UIStackView()
        contentView.axis = .vertical
        contentView.spacing = 10
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        for i in 0..<jogos.count {
            let jogo = jogos[i]
            let card = generateCard(timeCasa: jogo.timeA, timeVisitante: jogo.timeB, pontos: jogo.placar, backgroundColor: jogo.backgroundColor)
    
            contentView.addArrangedSubview(card)
            NSLayoutConstraint.activate([
                card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                card.heightAnchor.constraint(equalToConstant: 100)
            ])
        }
       
        
        return vw
    }()
    
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
            setCurrentView(tabelaView)
        case 1:
            setCurrentView(jogosView)
        case 2:
            print("2")
        default:
            print("out of range segmented control item")
        }
    }
}


func generateCard(timeCasa: String, timeVisitante: String, pontos: String, backgroundColor: UIColor) -> UIView {
    let brasaoCasa = UIView()

    let placar = UIView()
    
    let brasaovisitante = UIView()
    
    let card = UIStackView(arrangedSubviews: [brasaoCasa, placar, brasaovisitante])
    card.layer.cornerRadius = CGFloat(10)
    card.backgroundColor = backgroundColor

    card.translatesAutoresizingMaskIntoConstraints = false
    card.distribution = .fillEqually
    

    //placar
    let placarText = UILabel()
    placarText.text = pontos
    placarText.textColor = .white
    placarText.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    placarText.translatesAutoresizingMaskIntoConstraints = false
    placar.addSubview(placarText)
    NSLayoutConstraint.activate([
        placarText.centerYAnchor.constraint(equalTo: placar.centerYAnchor),
        placarText.centerXAnchor.constraint(equalTo: placar.centerXAnchor),
    ])
    
    let generateBrasao = {(nome: String, parentView: UIView, isEspelhado: Bool) in
        let brasaoCard = UIView()
        brasaoCard.layer.cornerRadius = CGFloat(10)
        brasaoCard.translatesAutoresizingMaskIntoConstraints = false
        brasaoCard.widthAnchor.constraint(equalToConstant: 70).isActive = true
        brasaoCard.heightAnchor.constraint(equalToConstant: 60).isActive = true
        brasaoCard.backgroundColor = .blue
        parentView.addSubview(brasaoCard)
        NSLayoutConstraint.activate([
            brasaoCard.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 8)
        ])
        
        if isEspelhado {
            brasaoCard.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -8).isActive = true
        } else {
            brasaoCard.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 8).isActive = true
        }
        
        let nomeCasa = UILabel()
        nomeCasa.translatesAutoresizingMaskIntoConstraints = false
        nomeCasa.text = nome
        nomeCasa.textColor = .white
        nomeCasa.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        parentView.addSubview(nomeCasa)
        NSLayoutConstraint.activate([
            nomeCasa.topAnchor.constraint(equalTo: brasaoCard.bottomAnchor, constant: 5),
            nomeCasa.centerXAnchor.constraint(equalTo: brasaoCard.centerXAnchor)
        ])
    }
    
    
    generateBrasao(timeCasa, brasaoCasa, false)
    generateBrasao(timeVisitante, brasaovisitante, true)
    
    return card
}
