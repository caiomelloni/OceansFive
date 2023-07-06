//
//  JogosView.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 06/07/23.
//

import UIKit

struct Jogo {
    let timeA: String
    let timeB: String
    let placar: String
    let backgroundColor: UIColor
    let onClick: () -> Void
}



class JogosView {
    var jogos: [Jogo] = []
    
    func getView(_ superview: UIViewController, _ jogos: [Jogo]) -> UIView {
        self.jogos = jogos
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
        card.setOnClickListener {
            jogo.onClick()
        }

        contentView.addArrangedSubview(card)
        NSLayoutConstraint.activate([
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            card.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
   
    
    return vw
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

}
