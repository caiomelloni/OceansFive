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


let sumula = Sumula(id: UUID(), timeA: timeJogando1, timeB: timeJogando2, campeonato: camp1, periodosExtra: 0, arbitros: ["Árbitro 1", "Árbitro 2"], local: "Ginásio XYZ", horarioInicio: Date(), horarioTermino: Date(), mesa: ["Membro 1", "Membro 2"])







