////
////  File.swift
////  OceansFive
////
////  Created by Bruno Dias on 10/07/23.
////
//
//import Foundation
//
//
//
struct Sum {
    var periodo: Int = 0

    func quarto () -> Int {
        var flag = self.periodo

        if flag<=3{
            flag += 1
        }
        else {
        //implementar caso os pontos estiverem iguais

        }

        return periodo
    }

    func numeroJog(time: inout TimeJogando) {
        for (index, jg) in time.time.jogadores.enumerated(){
            time.numeroJogador[index] = jg.id
        }
    }


    func lanceLivre(numeroJogador: Int, time: inout TimeJogando) {
        //print(timeJogando1.numeroJogador[10])
        time.ponto.lanceLivrePonto[periodo].append(time.numeroJogador[numeroJogador]!)

        for (index, jg) in time.time.jogadores.enumerated() {
            if jg.id == time.numeroJogador[numeroJogador]{
                //colocar o UUID do jogo e nao do jogador

//                withUnsafePointer(to: jogadores1) { pointer in
//                    print(pointer)
//                }

                time.time.jogadores[index].pontos.lanceLivrePonto[periodo].append(Singleton.shared.sumula.id)
            }
        }
    }

    func dois(numeroJogador: Int, time: inout TimeJogando) {
        time.ponto.doisPontos[periodo].append(time.numeroJogador[numeroJogador]!)

        for (index, jg) in time.time.jogadores.enumerated() {
            if jg.id == time.numeroJogador[numeroJogador]{
                    //colocar o UUID do jogo e nao do jogador
                time.time.jogadores[index].pontos.doisPontos[periodo].append(Singleton.shared.sumula.id)
                }
            }

        }



    func tres(numeroJogador: Int, time: inout TimeJogando) {

        time.ponto.tresPontos[periodo].append(time.numeroJogador[numeroJogador]!)

        for (index, jg) in time.time.jogadores.enumerated() {
            if jg.id == time.numeroJogador[numeroJogador]{
                //colocar o UUID do jogo e nao do jogador
                time.time.jogadores[index].pontos.tresPontos[periodo].append(Singleton.shared.sumula.id)
            }
            else{
            }

        }
        //time.deallocate()
    }

//    func falta() {
//        falt.qtdFaltas += 1
//
//
//            timeJogando1.faltas[periodo].append(timeJogando1.numeroJogador[10]!)
//
//            for (index, jg) in jogadores1.enumerated() {
//                if jg.id == timeJogando1.numeroJogador[10]{
//                    //colocar o UUID do jogo e nao do jogador
//                    jogadores1[index].faltas.qtdFaltas += 1
//                }
//                else{
//                }
//        }
//
//    }

//    func tempo() {
//        timeJogando1.tempos[periodo].append(timeJogando1.tempos[periodo].count + 1)
//    }
    
    
    
    
        
        
    }
