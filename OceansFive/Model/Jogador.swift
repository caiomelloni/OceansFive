//
//  Jogador.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//

import Foundation

struct Jogador: Equatable {
    let id: UUID
    let nome: String
    let pontos: Pontos
    let faltas: Faltas
    //let times: [Time]
}
