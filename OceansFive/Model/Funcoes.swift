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
import Foundation

struct Sum {

    
    mutating func quarto () {

        if Singleton.shared.sumula.periodo < 3 {
            Singleton.shared.sumula.periodo += 1
        }
        else {
            let pontosA: Int = leitorPontos(time: &Singleton.shared.sumula.timeA)
            let pontosB: Int = leitorPontos(time: &Singleton.shared.sumula.timeB)
            if pontosA == pontosB {
                Singleton.shared.sumula.periodosExtra += 1
            } else {
                Singleton.shared.sumula.horarioTermino = Date().formatted(date: .omitted, time: .shortened).lowercased()
            }

        }
    }

//    mutating func setaPeriodo() {
//        self.quarto(self.periodo)
//    }
//
    func numeroJog(time: inout TimeJogando) {
        for (index, jg) in time.time.jogadores.enumerated(){
            time.numeroJogador[index] = jg.id
        }
    }
    
    
    func marcaLanceLivre(numeroJogador: Int, time: inout TimeJogando) {
        if numeroJogador < 12 && Singleton.shared.sumula.periodo >= 0 {
            time.ponto.lanceLivrePonto[Singleton.shared.sumula.periodo].append(time.numeroJogador[numeroJogador]!)
            for (index, jg) in time.time.jogadores.enumerated() {
                if jg.id == time.numeroJogador[numeroJogador]{
                    time.time.jogadores[index].pontos.lanceLivrePonto[Singleton.shared.sumula.periodo].append(Singleton.shared.sumula.id)
                }
            }
        }
    }
    
    func marcaDoisPts(numeroJogador: Int, time: inout TimeJogando) {
        if numeroJogador < 12 && Singleton.shared.sumula.periodo >= 0 {
            time.ponto.doisPontos[Singleton.shared.sumula.periodo].append(time.numeroJogador[numeroJogador]!)

            for (index, jg) in time.time.jogadores.enumerated() {
                if jg.id == time.numeroJogador[numeroJogador]{
                    //colocar o UUID do jogo e nao do jogador
                    time.time.jogadores[index].pontos.doisPontos[Singleton.shared.sumula.periodo].append(Singleton.shared.sumula.id)
                }
            }
        }
        
    }
    
    
    
    func marcaTresPts(numeroJogador: Int, time: inout TimeJogando) {
        if numeroJogador < 12 && Singleton.shared.sumula.periodo >= 0 {
            time.ponto.tresPontos[Singleton.shared.sumula.periodo].append(time.numeroJogador[numeroJogador]!)

            for (index, jg) in time.time.jogadores.enumerated() {
                if jg.id == time.numeroJogador[numeroJogador]{
                    //colocar o UUID do jogo e nao do jogador
                    time.time.jogadores[index].pontos.tresPontos[Singleton.shared.sumula.periodo].append(Singleton.shared.sumula.id)
                }
                else{
                }
            }
        }
    }

    func tempo(tempo: Int, time: inout TimeJogando) {
        if Singleton.shared.sumula.periodo >= 0 {
            time.tempos[Singleton.shared.sumula.periodo].append(tempo)
        }
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
    
    func faltas(numeroJogador: Int , time: inout TimeJogando){
        if numeroJogador < 12 && Singleton.shared.sumula.periodo >= 0 {
            time.faltas[Singleton.shared.sumula.periodo].append(time.numeroJogador[numeroJogador]!)

        print("Singleton.shared.sumula.periodo \(Singleton.shared.sumula.periodo)")
            for (index, jg) in time.time.jogadores.enumerated() {
                if jg.id == time.numeroJogador[numeroJogador]{
                    //colocar o UUID do jogo e nao do jogador
                    time.time.jogadores[index].faltas.qtdFaltas += 1
                }
                else{
                }
            }
        }
    }

    func contaTresPts(time: TimeJogando) -> Int {
        var pts: Int = 0
        for periodo in  0...3 {
            pts += time.ponto.tresPontos[periodo].count
        }
        return pts
    }
    func contaDoisPts(time: TimeJogando) -> Int {
        var pts: Int = 0
        for periodo in  0...3 {
            pts += time.ponto.doisPontos[periodo].count
        }
        return pts
    }
    func contaLanceLivre(time: TimeJogando) -> Int {
        var pts: Int = 0
        for periodo in  0...3 {
            pts += time.ponto.lanceLivrePonto[periodo].count
        }
        return pts
    }
    func contaFaltas(time: TimeJogando) -> Int {
        var faltas: Int = 0
        for periodo in  0...3 {
            faltas += time.faltas[periodo].count
        }
        return faltas
    }
    
    func leitorFaltas(prd: Int ,time: inout TimeJogando) -> Int{
        var fts:Int = 0
        fts = time.faltas[prd].count
        
        return fts
    }
}
    
    
    
    

      
