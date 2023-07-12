//
//  TimeJogando.swift
//  OceansFive
//
//  Created by Bruno Dias on 06/07/23.
//

import Foundation


// usado para controle do time durante o jogo, usado para preencher os dados dos jogadores naquela partida, porntando os botões devem preencher estes dados durante o jogo, e ao final do jogo, passar estes dados aos demais locais do aplicativo
struct TimeJogando {
    var time: Time
    var faltas : Array<Array<UUID>>
    var tempos: Array<Array<Int>>
    var jogando: [Jogador]
    var ponto: Pontos
    var numeroJogador: Dictionary<Int,UUID>
}

