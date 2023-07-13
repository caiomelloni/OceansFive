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
    let idTorneio: String

}

struct CKJogo {
    let criador: String
    let jogoFinalizado: Bool
    let timeCasa: String
    let timeVisitante: String
    let idTorneio: String
    let placar: String
    let gameId: String
}

class Backend {
    private static var instance: Backend?
    private static var userId: String?
    
    private init() {}
    
    
    
    static func start() {
        iCloudUserIDAsync() {
            recordID, error in
            if let userID = recordID?.recordName {
                Self.userId = userID
            } else {
                print("Fetched iCloudID was nil")
            }
        }
    }
    
    private static func getInstance() -> Backend {
        if instance == nil {
            instance = Backend()
        }
        
        return instance!
    }
    
    
    static func createTorneio(nome: String, formato: FormatoTorneio, qtdTimes: Int, onFinished: @escaping (CKRecord?, Error?) -> Void) {
        let torneioRecord = CKRecord(recordType: "Torneio")
        torneioRecord.setValuesForKeys([
            "nome": nome,
            "formato" : formato.rawValue,
            "qtdTime": qtdTimes,
            "userId": userId,
            "times": ["LAU", "LEU"],
        ])
        
        let container = CKContainer.default()
        let database = container.publicCloudDatabase
        
        database.save(torneioRecord) { record, error in
            onFinished(record, error)
        }
        
        let jogoRecord = CKRecord(recordType: "Jogo")
        jogoRecord.setValuesForKeys([
            "criador": userId,
            "jogoFinalizado": false,
            "timeCasa": "TIME A",
            "timeVisitante": "TIME B",
            "idTorneio": torneioRecord.recordID.recordName,
            "placar": "-- X --",
            "gameId": jogoRecord.recordID.recordName
        ])
        
        database.save(jogoRecord) { record, error in}
        
    }
    
    
    static func fetchTorneios(onFinished: @escaping ([CKTorneio]) -> Void, _ onlyUserTorneio: Bool = false) {
        var query = CKQuery(recordType: "Torneio", predicate: NSPredicate(value: true))
        
        if onlyUserTorneio {
            query = CKQuery(recordType: "Torneio", predicate: NSPredicate(format: "userId=%@", userId!))
        }
        
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
                        let torneio = CKTorneio(nome: record["nome"] as! String, formato: formato, qtdTimes: record["qtdTime"] as! Int, idTorneio: record.recordID.recordName)
                        torneios.append(torneio)
                        
                        
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
    
    static func fetchJogos(_ idTorneio: String, onFinished: @escaping ([CKJogo]) -> Void) {
        let query = CKQuery(recordType: "Jogo", predicate: NSPredicate(format: "idTorneio=%@", idTorneio))
        
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        CKContainer.default().publicCloudDatabase.fetch(withQuery: query) { result in
            switch result {
            case .success(let success):
                let fetches = success.matchResults
                var jogos: [CKJogo] = []
                for fetch in fetches {
                    let fetchResult = fetch.1
                    switch fetchResult {
                    case .success(let record):
                        let jogo = CKJogo(criador: record["criador"] as! String, jogoFinalizado: record["jogoFinalizado"] as! Bool, timeCasa: record["timeCasa"] as! String, timeVisitante: record["timeVisitante"] as! String, idTorneio: record["idTorneio"] as! String , placar: record["placar"] as! String, gameId: record["gameId"] as! String)
                        jogos.append(jogo)
                        
                        
                    case .failure(let errorFetchingRecord):
                        print("Nao conseguiu baixar um card em especifico")
                        
                    }
                    
                }
                onFinished(jogos)
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    static func updateGame(gameId: String, placar: String) {
        let recordID = CKRecord.ID(recordName: gameId)
        let db = CKContainer.default().publicCloudDatabase

        db.fetch(withRecordID: recordID) { record, error in

            if let record = record, error == nil {

                record.setValuesForKeys(["placar": placar, "jogoFinalizado": true])

                db.save(record) { _, error in
                    print(error)
                }
            }
        }
    }
    
    /// async gets iCloud record name of logged-in user
    static func iCloudUserIDAsync(complete: @escaping (CKRecord.ID?, NSError?) -> ()) {
        let container = CKContainer.default()
        container.fetchUserRecordID() {
            recordID, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                complete(recordID, nil)
            }
        }
    }
    
}
