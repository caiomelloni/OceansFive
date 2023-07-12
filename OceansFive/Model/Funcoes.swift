//
//  File.swift
//  OceansFive
//
//  Created by Bruno Dias on 10/07/23.
//

import Foundation



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
    
    func numeroJog() {
        for (index, jg) in jogadores1.enumerated(){
            timeJogando1.numeroJogador[index] = jg.id
        }
    }

    
    func lanceLivre() {
        
        timeJogando1.ponto.lanceLivrePonto[periodo].append(timeJogando1.numeroJogador[10]!)
        
        for (index, jg) in jogadores1.enumerated() {
            if jg.id == timeJogando1.numeroJogador[10]{
                //colocar o UUID do jogo e nao do jogador
                jogadores1[index].pontos.lanceLivrePonto[periodo].append(sumula.id)
            }
            else{
            }
        }
    }
        
        func dois() {
            timeJogando1.ponto.doisPontos[periodo].append(timeJogando1.numeroJogador[10]!)
            
            for (index, jg) in jogadores1.enumerated() {
                if jg.id == timeJogando1.numeroJogador[10]{
                    //colocar o UUID do jogo e nao do jogador
                    jogadores1[index].pontos.doisPontos[periodo].append(sumula.id)
                }
                else{
                }
            }
            
        }
        
    
    
    func tres() {
        timeJogando1.ponto.tresPontos[periodo].append(timeJogando1.numeroJogador[10]!)
        
        for (index, jg) in jogadores1.enumerated() {
            if jg.id == timeJogando1.numeroJogador[10]{
                //colocar o UUID do jogo e nao do jogador
                jogadores1[index].pontos.tresPontos[periodo].append(sumula.id)
            }
            else{
            }
        }
    }
    
    func falta() {
        
        
        
            timeJogando1.faltas[periodo].append(timeJogando1.numeroJogador[10]!)
            
            for (index, jg) in jogadores1.enumerated() {
                if jg.id == timeJogando1.numeroJogador[10]{
                    //colocar o UUID do jogo e nao do jogador
                    jogadores1[index].faltas.qtdFaltas += 1
                }
                else{
                }
        }
        
    }
    
    func tempo() {
        timeJogando1.tempos[periodo].append(timeJogando1.tempos[periodo].count + 1)
    }
    
    func contapontototal()-> Int {
        var pto : Int = 0
        
            for (_, ptos) in jogadores1.enumerated() {
                for i in 0...4{
                    pto += ptos.pontos.lanceLivrePonto[i].count + (ptos.pontos.doisPontos[i].count * 2) + (ptos.pontos.tresPontos[i].count * 3)
            }
        }
        return pto
    }
    
    
    
    
    }
    
    
    
    



