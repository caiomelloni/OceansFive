//
//  Pontos.swift
//  OceansFive
//
//  Created by Bruno Dias on 06/07/23.
//

import Foundation


// Preenchido com 4 arrays, cada array com o ID, cada uma destas arrays representa um quarto do jgo
// se for no tipo Sumula contem o ID do jogador que marcou o ponto, repetidas vezes representando o numero de cestas marcadas pelo jogador
// se for no Tipo Jogador, contem o ID do jogo, repetidas vezes representando o numero de cestas marcadas naquele jogo
struct Pontos: Equatable {
    var lanceLivrePonto: Array<Array<UUID>> = [[],[],[],[]]
    var doisPontos: Array<Array<UUID>> = [[],[],[],[]]
    var tresPontos: Array<Array<UUID>> = [[],[],[],[]]
}

