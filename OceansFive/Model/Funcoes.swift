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
    }
    
    func leitorPontos(time : inout TimeJogando) -> Int{
        
        var pts:Int = 0
        
        for i in 0...3 {
            pts += time.ponto.lanceLivrePonto[i].count
            pts += time.ponto.doisPontos[i].count * 2
            pts += time.ponto.tresPontos[i].count * 3
        }
        
//        print(pts)
        return pts
    }
    
    func faltas(numeroJogador: Int , time: inout TimeJogando){
        
        time.faltas[periodo].append(time.numeroJogador[numeroJogador]!)
        
        for (index, jg) in time.time.jogadores.enumerated() {
            if jg.id == time.numeroJogador[numeroJogador]{
                //colocar o UUID do jogo e nao do jogador
                time.time.jogadores[index].faltas.qtdFaltas += 1
            }
            else{
            }
        }
    }
    
    func leitorFaltas(prd: Int ,time : inout TimeJogando) -> Int{
        var fts:Int = 0
        fts = time.faltas[prd].count
        
        return fts
    }
}
    
    
    
    

      
