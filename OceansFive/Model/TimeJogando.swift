//
//  TimeJogando.swift
//  OceansFive
//
//  Created by Bruno Dias on 06/07/23.
//

import Foundation

struct TimeJogando {
    var time: Time
    var faltas : Array<Array<UUID>>
    var tempos: Array<Array<Int>>
    var jogando: [Jogador]
    var ponto: Pontos
    var numeroJogador: Dictionary<UUID,Int>
}
