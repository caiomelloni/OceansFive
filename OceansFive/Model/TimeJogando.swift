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
    var numeroJogador: Dictionary<Int,UUID>
}



// Criação dos times jogando
var timeJogando1 = TimeJogando(time: time1, faltas: [[],[],[],[]], tempos: [[],[],[],[]], jogando: jogadores1, ponto: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), numeroJogador: [:])
let timeJogando2 = TimeJogando(time: time2, faltas: [[],[],[],[]], tempos: [[],[],[],[]], jogando: jogadores2, ponto: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), numeroJogador: [:])
