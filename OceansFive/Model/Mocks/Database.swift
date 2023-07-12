////
////  Database.swift
////  OceansFive
////
////  Created by Marcelo Pastana Duarte on 11/07/23.
////
//
//import Foundation
//import UIKit
//
////Singleton
//
//class Database {
//    static let shared = Database()
//    private init() {}
//
//    static var sumula = Sumula(id: UUID(),
//                        timeA: Self.shared.timeJogando1,
//                        timeB: Self.shared.timeJogando2,
//                        campeonato: Self.shared.camp1,
//                        periodosExtra: 0,
//                        arbitros: ["Árbitro 1", "Árbitro 2"],
//                        local: "Ginásio XYZ",
//                        horarioInicio: Date(),
//                        horarioTermino: Date(),
//                        mesa: ["Membro 1", "Membro 2"]
//    )
//
//    static var camp1: Campeonato = Campeonato(image: UIImage(imageLiteralResourceName: "cpi"),
//                                       id: UUID(),
//                                       nome: "TUC",
//                                       qtdTimes: 1,
//                                       times: [Self.shared.timeA, Self.shared.timeB]
//    )
//
////    static var timeA = Time(id: UUID(),
////                     nome: "TimeA",
////                     abreviado: "TiA",
////                     tecnico: "Maradona",
////                     jogadores: Self.jogadores1
////    )
////
////    static var timeB = Time(id: UUID(),
////                     nome: "TimeB",
////                     abreviado: "TiB",
////                     tecnico: "Pelé",
////                     jogadores: Self.jogadores2
////    )
//
//    // Criação dos times jogando

//
//
////    let pts = Pontos(lanceLivrePonto: [[]],
////                     doisPontos: [[]],
////                     tresPontos: [[]])
////
////    let flts = Faltas(jogoID: UUID(),
////                      qtdFaltas: 0)
//
//
////    static var jogadores1 = [
////        Jogador(id: UUID(), nome: "João Silva", pontos: Pontos(lanceLivrePonto: [[UUID()],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Pedro Santos", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "André Oliveira", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Lucas Rodrigues", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Matheus Almeida", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Gabriel Pereira", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Rafael Costa", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Bruno Ferreira", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Gustavo Carvalho", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Guilherme Sousa", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Felipe Gonçalves", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Victor Lima", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0))
////    ]
////
////    static var jogadores2: Array<Jogador> = [
////        Jogador(id: UUID(), nome: "Daniel Santos", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Thiago Oliveira", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Marcelo Silva", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Eduardo Souza", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Luiz Rodrigues", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Diego Almeida", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Carlos Pereira", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Samuel Costa", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Tiago Ferreira", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Rodrigo Carvalho", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Leonardo Sousa", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
////        Jogador(id: UUID(), nome: "Lucas Gonçalves", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0))
////    ]
//}
