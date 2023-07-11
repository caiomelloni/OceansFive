//
//  Faltas.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 06/07/23.
//

import Foundation

struct Faltas: Equatable {
    let jogoID: UUID
    var qtdFaltas: Int
}

var falt = Faltas(jogoID: UUID(), qtdFaltas: 0)

