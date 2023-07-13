//
//  CampeonatoClassTableViewCell.swift
//  OceansFive
//
//  Created by Bruno Dias on 05/07/23.
//

import UIKit

struct Torneio {
    let cardColor: UIColor, title: String, imagePath: String, qtdTime: Int, formato: FormatoTorneio, idTorneio: String
}

protocol CardViewDelegate {
    func navigateToTornament(_ torneio: Torneio)
}

class CardView: UIView {
    
    var delegate: CardViewDelegate?
    
    let card: UIView = {
        let card = UIView()
        card.backgroundColor = PaleteColor.orange
        card.layer.cornerRadius = CGFloat(12)
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private func buildImage(_ path:String) -> UIImageView {
        let imgvw = UIImageView()
        imgvw.translatesAutoresizingMaskIntoConstraints = false
        imgvw.contentMode = .scaleAspectFit
        imgvw.layer.cornerRadius = 10.0
        imgvw.clipsToBounds = true
        imgvw.image = UIImage(named: path)
        return imgvw
    }
    
    var imgvw: UIImageView = UIImageView()
    
    let lbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 24, weight: .bold)
        lbl.text = "Torneio Titulo"
        return lbl
    }()
    

    
    private var torneio: Torneio
    init(_ torneio: Torneio) {
        self.torneio = torneio
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 120).isActive = true
        card.backgroundColor = torneio.cardColor
        lbl.text = torneio.title
        imgvw = buildImage(torneio.imagePath)
        
        //Add card click
        card.setOnClickListener {
            self.delegate?.navigateToTornament(self.torneio)
        }
        
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildLayout() {
        addSubview(card)
        
        NSLayoutConstraint.activate([
            card.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            card.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            card.topAnchor.constraint(equalTo: topAnchor),
            card.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        card.addSubview(imgvw)
        card.addSubview(lbl)
        
        NSLayoutConstraint.activate([
            imgvw.heightAnchor.constraint(equalToConstant: 94),
            imgvw.widthAnchor.constraint(equalToConstant: 94),
            imgvw.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            imgvw.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -16),
            
            lbl.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            lbl.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 16),
            lbl.trailingAnchor.constraint(equalTo: imgvw.leadingAnchor, constant: -16)
            
        ])
    }
}
