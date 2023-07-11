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


// Criação dos times
let time1 = Time(id: UUID(), nome: "Time 1", abreviado: "T1", tecnico: "Técnico 1", jogadores: jogadores1)

let time2 = Time(id: UUID(), nome: "Time 2", abreviado: "T2", tecnico: "Técnico 2", jogadores: jogadores2)


		
