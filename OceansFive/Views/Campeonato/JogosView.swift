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
    let gameId: String
    let backgroundColor: UIColor
    let onClick: () -> Void
}

protocol JogosViewDelegate:UIViewController {
    func updateJogosView()
}



class JogosView: UIView {
    var jogos: [Jogo] = []
    var parentView: JogosViewDelegate
    var torneio: Torneio
    
    init(_ torneio: Torneio, _ parentView: JogosViewDelegate) {
        self.parentView = parentView
        self.torneio = torneio
        super.init(frame: .zero)
        Backend.fetchJogos(torneio.idTorneio) { ckjogos in
            for jogo in ckjogos {
                self.jogos.append(Jogo(timeA: jogo.timeCasa, timeB: jogo.timeVisitante, placar: jogo.jogoFinalizado ? jogo.placar : "-- X --", gameId: jogo.gameId ,backgroundColor: .systemBlue,onClick: {
                    parentView.updateJogosView()
//                    if jogo.jogoFinalizado {
//                        // go to sumulapreenchida
//                        parentView.navigationController?.pushViewController(SumulaPreenchidaViewController(), animated: true)
//                    } else {
//                        // go to preencher sumula
//                        //Backend.updateGame(gameId: jogo.gameId, placar: "2 X 1")
//                        parentView.navigationController?.pushViewController(SumulaViewController(), animated: true)
//                    }
                }))
            }
            DispatchQueue.main.async {
                self.buildLayout(parentView, torneio.idTorneio)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildLayout(_ parentView: UIViewController, _ torneioId: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .secondarySystemBackground
        
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
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
