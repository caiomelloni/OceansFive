//
//  File.swift
//  OceansFive
//
//  Created by Bruno Dias on 06/07/23.
//

import Foundation
import UIKit


struct Sumula {
    let id : UUID
    let timeA: TimeJogando
    let timeB: TimeJogando
    let campeonato: Campeonato
    var periodosExtra: Int = 0
    let arbitros: [String]
    let local: String
    var horarioInicio: Date
    var horarioTermino: Date
    var mesa: [String]
}
