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
    let qtdTimes: Int
    let times: [Time]
    //let colaboradores: [Colaboradores]
}

var campeonato_mock: Campeonato = Campeonato(image: UIImage(imageLiteralResourceName: "cpi"), id: UUID(), nome: "TUC", qtdTimes: 1, times: TimeViewModel().times)

    
