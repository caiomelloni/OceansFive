//
//  TimeAeB.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//

import Foundation

class TimeViewModel {

    private(set) var times: [Time] = [
        Time(id: UUID(),
            nome: "TimeA",
            abreviado: "TiA",
            tecnico: "Maradona",
            jogadores: timeA_jogadores
            ),
        Time(id: UUID(),
            nome: "TimeB",
            abreviado: "TiB",
            tecnico: "Pelé",
            jogadores: timeB_jogadores
            ),

    ]
}

let timeA = TimeViewModel().times[0]
let timeB = TimeViewModel().times[1]

let timeA_jogadores: [Jogador] = [
    Jogador(id: UUID(), nome: "Igor Almo", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Marcelo PPP", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Caio Alberto", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Leblon Filho", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Bruno Alvees", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Lucas Messi", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Nivaldo olveira", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Carlos Adão", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Joao da nica", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Chespirito", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Seu Barriga", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Dona Florinda", pontos: 0, faltas: 0),
]


let timeB_jogadores: [Jogador] = [
    Jogador(id: UUID(), nome: "Goku Gohan", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Gohan Gohan", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Titi Gohan", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Bulma Trunks", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Vegeta Saiajyn", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Radix Gohan", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Kuririn Trunks", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Trunks Trunks", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Majin Bu", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Cell", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Android 18", pontos: 0, faltas: 0),
    Jogador(id: UUID(), nome: "Android 17", pontos: 0, faltas: 0),
]
