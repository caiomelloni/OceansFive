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
    
    
    static func fetchTorneios(onFinished: @escaping (Result<CKQueryOperation.Cursor?, any Error>) -> Void) {
        let pred = NSPredicate(value: true)
        let query = CKQuery(recordType: "Torneio", predicate: pred)
        let operation = CKQueryOperation(query: query)
        
        operation.queryResultBlock = {result in
            
            onFinished(result)
        }
        
        CKContainer.default().publicCloudDatabase.add(operation)
    }
    
}
