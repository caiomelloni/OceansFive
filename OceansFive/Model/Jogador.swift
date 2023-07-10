//
//  Jogador.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//

import Foundation
// os arrays representam os quartos, estes dados sao preenchidos ao final do jogo
struct Jogador: Equatable {
    let id: UUID = UUID()
    let nome: String
    let pontos: Pontos = Pontos(lanceLivrePonto: [[],[],[],[]],
                                doisPontos: [[],[],[],[]],
                                tresPontos: [[],[],[],[]])
    let faltas: [[Faltas?]] = [[],[],[],[]]
    //let times: [Time]
}
