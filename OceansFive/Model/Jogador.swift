//
//  Jogador.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//

import Foundation


// os arrays representam os quartos, estes dados sao preenchidos ao final do jogo
struct Jogador: Equatable {
    var id: UUID //= UUID()
    var nome: String
    var pontos: Pontos
    var faltas: Faltas
    //let times: [Time]
}




