//
//  ExplorarViewController.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 28/06/23.
//

import UIKit

class MeusCampeonatosViewController: UIViewController {
    
    var cardsSection: CardsSectionView = CardsSectionView(cards: [], delegate: nil)
    var loadingSpinner = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(goToCriarTorneio))
            
        
        
        setUpTitle()
        loadCardsFromBackend()
    }
    
    
    func layout() {
        cardsSection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardsSection)
        
        let margins = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            cardsSection.topAnchor.constraint(equalTo: margins.topAnchor),
            cardsSection.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            cardsSection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardsSection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func setUpTitle() {
        self.title = "Meus Campeonatos"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .secondarySystemBackground
    }
    
    func initCardsSection(cards: [CardView]) {
        cardsSection.removeFromSuperview()
        cardsSection = CardsSectionView(cards: cards, delegate: self)
        layout()
    }
    
    func insertLoading() {
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        loadingSpinner.startAnimating()
        view.addSubview(loadingSpinner)
        
        loadingSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func removeLoading() {
        loadingSpinner.removeFromSuperview()
    }
    
    func loadCardsFromBackend() {
        insertLoading()
        
        Backend.fetchTorneios(onFinished: {torneios in
            DispatchQueue.main.async {
                var cards: [CardView] = []
                for torneio in torneios {
                    cards.append(CardView(Torneio(cardColor: .systemBlue, title: torneio.nome, imagePath: "cpi1")))
                }
                
                self.initCardsSection(cards: cards)
                
                self.removeLoading()
            }
        }, true)
    }
    
    func refreshCards() async {
        await withCheckedContinuation { continuation in
            Backend.fetchTorneios(onFinished: {torneios in
                DispatchQueue.main.async {
                    var cards: [CardView] = []
                    for torneio in torneios {
                        cards.append(CardView(Torneio(cardColor: .systemBlue, title: torneio.nome, imagePath: "cpi1")))
                    }
                    
                    self.initCardsSection(cards: cards)
                    continuation.resume()
                }
            }, true)
        }
    }
    
    @objc func goToCriarTorneio() {
        self.navigationController?.pushViewController(Criar_Torneio(), animated: true)
    }
}

extension MeusCampeonatosViewController: CardsSectionViewDelegate {
    func shouldRefreshData() async {
        await refreshCards()
    }
}

