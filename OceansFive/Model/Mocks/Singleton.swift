//
//  Singleton.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 11/07/23.
//

import Foundation

class Singleton {
    private init() {}
    static let shared: Singleton = {
        let instance = Singleton()

        return instance
    }()

    var sumula: Sumula = Sumula(id: UUID(),
                                       timeA: TimeJogando(time: Time(id: UUID(),
                                                                     nome: "TimeA",
                                                                     abreviado: "TiA",
                                                                     tecnico: "Sergio Wilson",
                                                                     jogadores: [
                                                                         Jogador(id: UUID(), nome: "João Silvasauro", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                                         Jogador(id: UUID(), nome: "Pedro Santos", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                                         Jogador(id: UUID(), nome: "André Oliveira", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                                         Jogador(id: UUID(), nome: "Lucas Rodrigues", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                                         Jogador(id: UUID(), nome: "Matheus Almeida", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                                         Jogador(id: UUID(), nome: "Gabriel Pereira", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                                         Jogador(id: UUID(), nome: "Rafael Costa", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                                         Jogador(id: UUID(), nome: "Bruno Ferreira", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                                         Jogador(id: UUID(), nome: "Gustavo Carvalho", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                                         Jogador(id: UUID(), nome: "Guilherme Sousa", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                                         Jogador(id: UUID(), nome: "Felipe Gonçalves", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                                         Jogador(id: UUID(), nome: "Victor Lima", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0))
                                                                                     ]),
                                                          faltas: [[],[],[],[]],
                                                          tempos: [[],[],[],[]],
                                                          jogando: [],
                                                          ponto: Pontos(lanceLivrePonto: [[],[],[],[]],
                                                                        doisPontos: [[],[],[],[]],
                                                                        tresPontos: [[],[],[],[]]),
                                                          numeroJogador: [:]),
                                       timeB: TimeJogando(time: Time(id: UUID(),
                                                                     nome: "TimeB",
                                                                     abreviado: "TiB",
                                                                     tecnico: "Paulo Timão",
                                                                     jogadores:[
                                                                        Jogador(id: UUID(), nome: "Daniel Santos", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                        Jogador(id: UUID(), nome: "Thiago Oliveira", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                        Jogador(id: UUID(), nome: "Marcelo Silva", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                        Jogador(id: UUID(), nome: "Eduardo Souza", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                        Jogador(id: UUID(), nome: "Luiz Rodrigues", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                        Jogador(id: UUID(), nome: "Diego Almeida", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                        Jogador(id: UUID(), nome: "Carlos Pereira", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                        Jogador(id: UUID(), nome: "Samuel Costa", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                        Jogador(id: UUID(), nome: "Tiago Ferreira", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                        Jogador(id: UUID(), nome: "Rodrigo Carvalho", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                        Jogador(id: UUID(), nome: "Leonardo Sousa", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
                                                                        Jogador(id: UUID(), nome: "Lucas Gonçalves", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0))
                                                                    ]),
                                                          faltas: [[],[],[],[]],
                                                          tempos: [[],[],[],[]],
                                                          jogando: [],
                                                          ponto: Pontos(lanceLivrePonto: [[],[],[],[]],
                                                                        doisPontos: [[],[],[],[]],
                                                                        tresPontos: [[],[],[],[]]),
                                                          numeroJogador: [:]),
                                       //campeonato: <#T##Campeonato#>,
                                       arbitros: ["Jeferson Soares"],
                                       local: "Ginásio Mané Garrincha",
                                       horarioInicio: Date(),
                                       horarioTermino: Date(),
                                       mesa: ["Henrique Guedes", "Milton Veloso", "Maria Faria"])
}

