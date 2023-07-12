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
    
    mutating func quarto () {

        //var flag = self.periodo
        if self.periodo < 3 {
            self.periodo += 1
        }
        else {
            let pontosA: Int = leitorPontos(time: &Singleton.shared.sumula.timeA)
            let pontosB: Int = leitorPontos(time: &Singleton.shared.sumula.timeB)
            if pontosA == pontosB {
                Singleton.shared.sumula.periodosExtra += 1
            }
        }
        
    }
    
    func numeroJog(time: inout TimeJogando) {
        for (index, jg) in time.time.jogadores.enumerated(){
            time.numeroJogador[index] = jg.id
        }
    }
    
    
    func lanceLivre(numeroJogador: Int, time: inout TimeJogando) {
        time.ponto.lanceLivrePonto[periodo].append(time.numeroJogador[numeroJogador]!)
        
        for (index, jg) in time.time.jogadores.enumerated() {
            if jg.id == time.numeroJogador[numeroJogador]{
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

    func tempo(tempo: Int, time: inout TimeJogando) {
        time.tempos[periodo].append(tempo)
    }
    
    
    
    
    func leitorPontos(time : inout TimeJogando) -> Int{
        
        var pts:Int = 0
        
        for i in 0...3 {
            pts += time.ponto.lanceLivrePonto[i].count
            pts += time.ponto.doisPontos[i].count * 2
            pts += time.ponto.tresPontos[i].count * 3
        }
        return pts
    }
}
    
    
    
    

      
