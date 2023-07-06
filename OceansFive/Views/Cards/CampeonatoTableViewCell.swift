//
//  CampeonatoClassTableViewCell.swift
//  OceansFive
//
//  Created by Bruno Dias on 05/07/23.
//

import UIKit

class CampeonatoTableViewCell: UITableViewCell {
    
    static let Cellid = "CampeonatoTableViewCell"
    
    private lazy var containervw: UIView = {
    let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.layer.cornerRadius = CGFloat(12)
        return vw
    }()
    
    private lazy var nomecamp: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
        
        
        return lbl
    }()
    
    private lazy var brasao : UIImageView = {
        let imgvw = UIImageView()
        imgvw.translatesAutoresizingMaskIntoConstraints = false
        imgvw.contentMode = .scaleAspectFit
        imgvw.layer.cornerRadius = 10.0
        imgvw.clipsToBounds = true

        return imgvw
        
    }()
    
    func configure () {
        containervw.backgroundColor = .systemBlue
        nomecamp.text = "Torneio Universitario de Campinas"
        self.brasao.image = UIImage(named: "cpi1")
        
        self.contentView.addSubview(containervw)
        containervw.addSubview(nomecamp)
        containervw.addSubview(brasao)
        
        
        NSLayoutConstraint.activate([
            containervw.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
//            containervw.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            containervw.heightAnchor.constraint(equalToConstant: 110),
            containervw.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant : 16),
            containervw.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant : -16),
            
            brasao.heightAnchor.constraint(equalToConstant: 94),
            brasao.widthAnchor.constraint(equalToConstant: 94),
            brasao.topAnchor.constraint(equalTo: containervw.topAnchor, constant: 8),
            brasao.trailingAnchor.constraint(equalTo : containervw.trailingAnchor, constant: -8),
            brasao.bottomAnchor.constraint(equalTo: containervw.bottomAnchor, constant: -8),
            
            
            nomecamp.topAnchor.constraint(equalTo: containervw.topAnchor, constant: 16),
            nomecamp.bottomAnchor.constraint(equalTo: containervw.bottomAnchor, constant: -16),
            nomecamp.leadingAnchor.constraint(equalTo: containervw.leadingAnchor, constant: 16),
            nomecamp.trailingAnchor.constraint(equalTo: brasao.leadingAnchor, constant: -32)
        
        ])
        
        
        
       
    }
    
    

   

}
