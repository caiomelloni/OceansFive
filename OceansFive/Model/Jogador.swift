//
//  Jogador.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//

import Foundation

struct Jogador: Equatable {
    let id: UUID
    let nome: String
    var pontos: Pontos
    var faltas: Faltas
    //let times: [Time]
}


var jogadores1 = [
    Jogador(id: UUID(), nome: "João Silva", pontos: Pontos(lanceLivrePonto: [[],[],[],[]], doisPontos: [[],[],[],[]], tresPontos: [[],[],[],[]]), faltas: Faltas(jogoID: UUID(), qtdFaltas: 0)),
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
    ]

var jogadores2: Array<Jogador> = [
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
    ]

