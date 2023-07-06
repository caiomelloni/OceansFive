//
//  Campenato.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//
import UIKit
import Foundation

struct Campeonato {
    let image: UIImage
    let id: UUID
    let nome: String
    let times: [Time]
    
}

var camp1:Campeonato = Campeonato(image: UIImage(imageLiteralResourceName: "cpi"), id: UUID(), nome: "TUC", times: TimeViewModel().times)

    


