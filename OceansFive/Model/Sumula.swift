//
//  File.swift
//  OceansFive
//
//  Created by Bruno Dias on 06/07/23.
//

import Foundation
import UIKit


struct Sumula {
    //identificador da sumula
    var id : UUID
    //contem as caracteristicas dinamicas da partida de times durante o jogo
    var timeA: TimeJogando
    var timeB: TimeJogando
    // Contem dados referentes ao campeoanto que pertence
    //let campeonato: Campeonato
    // contem dados sobre prorrogação da partida
    var periodosExtra: Int = 0
    // String com nome dos arbitros
    var arbitros: [String]
    // local do jogo
    var local: String
    //Marcadores de partida
    var horarioInicio: Date
    var horarioTermino: Date
    // responsáveis pela mesa (fiscal e mesa)
    var mesa: [String]
}









