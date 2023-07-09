//
//  ExplorarViewController.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 28/06/23.
//

import UIKit

class ExplorarViewController: UIViewController {
    
    var cardsSection: CardsSectionView = CardsSectionView(cards: [])
  
    override func viewDidLoad() {
        super.viewDidLoad()
        initCardsSection()
        setUpTitle()
        layout()
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
        self.title = "Explorar"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .secondarySystemBackground
    }
    
    func initCardsSection() {
        
        var cards: [CardView] = []
        
        for _ in 0...20 {
            let card = CardView(
                Torneio(cardColor: .systemBlue, title: "Torneio Universitario de Campinas", imagePath: "cpi1"))
            
            card.setOnClickListener {
                self.navigationController?.pushViewController(CampeonatoViewController(), animated: true)
            }
            
            cards.append(card)
        }
        
        cardsSection = CardsSectionView(cards: cards)
        
    }
}


