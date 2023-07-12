//
//  Backend.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 10/07/23.
//

import CloudKit

enum FormatoTorneio: String {
    case mataMata = "Mata-Mata"
    case faseGrupos = "Fase de Grupos"
    case faseGruposMaisMataMata = "Fase de Grupos + Mata-Mata"
}

struct CKTorneio {
    let nome: String
    let formato: FormatoTorneio
    let qtdTimes: Int
}

class Backend {
    private static var instance: Backend?
    
    private init() {}
    
    private static func getInstance() -> Backend {
        if instance == nil {
            instance = Backend()
        }
        
        return instance!
    }
    
    
    static func createTorneio(nome: String, formato: FormatoTorneio, qtdTimes: Int, onFinished: @escaping (CKRecord?, Error?) -> Void) {
        let record = CKRecord(recordType: "Torneio")
        record.setValuesForKeys([
            "nome": nome,
            "formato" : formato.rawValue,
            "qtdTime": qtdTimes
        ])
        
        let container = CKContainer.default()
        let database = container.publicCloudDatabase
        
        database.save(record) { record, error in
            onFinished(record, error)
        }
    }
    
    
    static func fetchTorneios(onFinished: @escaping ([CKTorneio]) -> Void) {
        let query = CKQuery(recordType: "Torneio", predicate: NSPredicate(value: true))
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        CKContainer.default().publicCloudDatabase.fetch(withQuery: query) { result in
            switch result {
            case .success(let success):
                let fetches = success.matchResults
                var torneios: [CKTorneio] = []
                for fetch in fetches {
                    let fetchResult = fetch.1
                    switch fetchResult {
                    case .success(let record):
                        let formato = FormatoTorneio(rawValue: record["formato"] as! String)!
                        let torneio = CKTorneio(nome: record["nome"] as! String, formato: formato, qtdTimes: record["qtdTime"] as! Int)
                        torneios.append(torneio)
                        //print(torneio)
                        
                        
                    case .failure(let errorFetchingRecord):
                        print("Nao conseguiu baixar um card em especifico")
                        
                    }
                    
                }
                onFinished(torneios)
                
            case .failure(let failure):
                print("Nao conseguiu puxar nenhum torneio")
            }
        }
    }
    
}
