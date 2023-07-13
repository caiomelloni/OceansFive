//
//  PlayersListVC.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 04/07/23.
//

import UIKit

struct Player {
    let numero: Int
    let nome: String
    let pontos: Int
    let faltas: Int
}

var players: [Player] = [
    Player(numero: 12, nome: "Caio", pontos: 20, faltas: 4),
    Player(numero: 23, nome: "João", pontos: 63, faltas: 5),
    Player(numero: 45, nome: "Pedro", pontos: 38, faltas: 3),
    Player(numero: 6, nome: "Bruno", pontos: 27, faltas: 3),
]

class PlayersList: UIView  {
    
//    var timePlayerList: Time = time1
    
    var timeList: Time = time1
    
//    Time(id: UUID(),
//                                      nome: "",
//                                      abreviado: "",
//                                      tecnico: "",
//                                      jogadores: [Jogador(id: UUID(),
//                                                          nome: "",
//                                                          pontos: pts,
//                                                          faltas: flts)
//                                      ])
    
    //MARK: -Labels e Header
    private func headerLbl() -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 14, weight: .heavy)
        lbl.textColor = .label

        return lbl
    }

    private lazy var numeroLbl: UILabel = headerLbl()
    private lazy var nomeLbl: UILabel = headerLbl()
    private lazy var pontosLbl: UILabel = headerLbl()
    private lazy var faltasLbl: UILabel = headerLbl()
    
    private lazy var headerVw: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    
    //MARK: -Components
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.separatorStyle = .singleLine
//        tv.isUserInteractionEnabled = false
        tv.register(SumulaTimeTableViewCell.self, forCellReuseIdentifier: SumulaTimeTableViewCell.cellId)
       return tv
    }()

    
    //MARK: -Func de config
    
    func loadData(_ index: Int) {
        if index == 0 {
            timeList = time1
        } else if index == 1 {
            timeList = time2
        }
        tableView.reloadData()
    }

    
    func configureTableView() {
        
        

        setTableViewDelegates()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        numeroLbl.text = "Número"
        nomeLbl.text = "Nome"
        pontosLbl.text = "Pontos"
        faltasLbl.text = "Faltas"
        

        self.addSubview(headerVw)
        
        self.addSubview(tableView)

        headerVw.addSubview(numeroLbl)
        headerVw.addSubview(nomeLbl)
        headerVw.addSubview(pontosLbl)
        headerVw.addSubview(faltasLbl)
        
        NSLayoutConstraint.activate([
            headerVw.heightAnchor.constraint(equalToConstant: 44),
            headerVw.topAnchor.constraint(equalTo: self.topAnchor),
            headerVw.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            headerVw.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),

            numeroLbl.topAnchor.constraint(equalTo: headerVw.topAnchor, constant: 16),
            numeroLbl.leadingAnchor.constraint(equalTo: headerVw.leadingAnchor, constant: 32),

            faltasLbl.topAnchor.constraint(equalTo: numeroLbl.topAnchor),
            faltasLbl.trailingAnchor.constraint(equalTo: headerVw.trailingAnchor, constant: -32),

            pontosLbl.topAnchor.constraint(equalTo: numeroLbl.topAnchor),
            pontosLbl.bottomAnchor.constraint(equalTo: numeroLbl.bottomAnchor),
            pontosLbl.trailingAnchor.constraint(equalTo: faltasLbl.leadingAnchor, constant: -32),

            nomeLbl.topAnchor.constraint(equalTo: numeroLbl.topAnchor),
            nomeLbl.bottomAnchor.constraint(equalTo: numeroLbl.bottomAnchor),
            nomeLbl.leadingAnchor.constraint(equalTo: numeroLbl.trailingAnchor, constant: 32),
            
            
            tableView.topAnchor.constraint(equalTo: headerVw.bottomAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureTableView()
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension PlayersList: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(timeList.jogadores.count)
        return timeList.jogadores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("\(indexPath)")
        print("\(indexPath.row)")
        let jogador = timeList.jogadores[indexPath.row]
        
        let jogador_indice = timeList.jogadores.firstIndex(where: { $0 == jogador }) as! Int
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SumulaTimeTableViewCell.cellId, for: indexPath) as! SumulaTimeTableViewCell
        cell.configure(with: jogador, index: jogador_indice)
    
        return cell
    }
    
    
}
