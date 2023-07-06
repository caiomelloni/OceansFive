//
//  Time.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//

import Foundation


struct Time {
    let id: UUID
    let nome: String
    let abreviado: String
    let tecnico: String
    //let campeonatos: [Campeonato]
    let jogadores: [Jogador]
}

struct TimeJogando {
    var time: Time
    var faltas: Array<Array<UUID>>
    var tempos: Array<Array<Int>>
    var jadoresJogando: [Jogador]
    var pontos: Array<Array<UUID>>
}



