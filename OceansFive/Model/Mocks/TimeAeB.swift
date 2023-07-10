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


//let pts = Pontos(lanceLivrePonto: [[]], doisPontos: [[]], tresPontos: [[]])
//let flts = Faltas(jogoID: NSUUID.z, qtdFaltas: 0)

let timeA_jogadores: [Jogador] = [
    Jogador(nome: "Igor Almo"),
    Jogador(nome: "Marcelo PPP"),
    Jogador(nome: "Caio Alberto"),
    Jogador(nome: "Leblon Filho"),
    Jogador(nome: "Bruno Alvees"),
    Jogador(nome: "Lucas Messi"),
    Jogador(nome: "Nivaldo olveira"),
    Jogador(nome: "Carlos Adão"),
    Jogador(nome: "Joao da nica"),
    Jogador(nome: "Chespirito"),
    Jogador(nome: "Seu Barriga"),
    Jogador(nome: "Dona Florinda"),
]


let timeB_jogadores: [Jogador] = [
    Jogador(nome: "Goku Gohan"),
    Jogador(nome: "Gohan Gohan"),
    Jogador(nome: "Titi Gohan"),
    Jogador(nome: "Bulma Trunks"),
    Jogador(nome: "Vegeta Saiajyn"),
    Jogador(nome: "Radix Gohan"),
    Jogador(nome: "Kuririn Trunks"),
    Jogador(nome: "Trunks Trunks"),
    Jogador(nome: "Majin Bu"),
    Jogador(nome: "Cell"),
    Jogador(nome: "Android 18"),
    Jogador(nome: "Android 17"),
]

