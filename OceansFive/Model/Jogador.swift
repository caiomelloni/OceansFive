//
//  Jogador.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//

import Foundation
import UIKit

struct Jogador: Equatable {
    let id: UUID
    let nome: String
    let pontos: Pontos
    let faltas: Dictionary<UUID,Int>
    //let times: [Time]
}
