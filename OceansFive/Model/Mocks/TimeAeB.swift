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


let pts = Pontos(lanceLivrePonto: [[UUID()]], doisPontos: [[UUID()]], tresPontos: [[UUID()]])
let flts = Faltas(jogoID: UUID(), qtdFaltas: 0)

let timeA_jogadores: [Jogador] = [
    Jogador(id: UUID(), nome: "Igor Almo", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Marcelo PPP", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Caio Alberto", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Leblon Filho", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Bruno Alvees", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Lucas Messi", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Nivaldo olveira", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Carlos Adão", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Joao da nica", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Chespirito", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Seu Barriga", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Dona Florinda", pontos: pts, faltas: flts),
]


let timeB_jogadores: [Jogador] = [
    Jogador(id: UUID(), nome: "Goku Gohan", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Gohan Gohan", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Titi Gohan", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Bulma Trunks", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Vegeta Saiajyn", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Radix Gohan", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Kuririn Trunks", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Trunks Trunks", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Majin Bu", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Cell", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Android 18", pontos: pts, faltas: flts),
    Jogador(id: UUID(), nome: "Android 17", pontos: pts, faltas: flts),
]
