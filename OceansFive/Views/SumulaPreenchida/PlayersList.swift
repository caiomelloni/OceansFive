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

//var players: [Player] = [
//    Player(numero: 12, nome: "Caio", pontos: 20, faltas: 4),
//]

class PlayersList: UIView  {
    private var time: Time = Time(id: UUID(),
                              nome: "",
                              abreviado: "",
                              tecnico: "",
                                  jogadores: [Jogador(id: UUID(),
                                                      nome: "",
                                                      pontos: Pontos(lanceLivrePonto: [[],[],[],[]],
                                                                     doisPontos: [[],[],[],[]],
                                                                     tresPontos: [[],[],[],[]]),
                                                      faltas: Faltas(jogoID: UUID(),
                                                                     qtdFaltas: 0)
                                                  )])

    private lazy var tableView: UITableView = {
        let tv = UITableView()
       tv.translatesAutoresizingMaskIntoConstraints = false
       tv.backgroundColor = .clear
       tv.rowHeight = UITableView.automaticDimension
       tv.estimatedRowHeight = 44
       tv.separatorStyle = .singleLine
        tv.register(SumulaTimeTableViewCell.self, forCellReuseIdentifier: SumulaTimeTableViewCell.cellId)
       return tv
    }()


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

    
    func configureTableView() {
        setTableViewDelegates()
        tableView.delegate = self
        tableView.dataSource = self

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
    func loadData(_ index: Int) {
        if index == 0 {
            time = Singleton.shared.sumula.timeA.time
        } else if index == 1 {
            time = Singleton.shared.sumula.timeB.time
        }
        tableView.reloadData()
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
        return time.jogadores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jogador = time.jogadores[indexPath.row]

        let jogador_indice = time.jogadores.firstIndex(where: { $0 == jogador }) as! Int

        let cell = tableView.dequeueReusableCell(withIdentifier: SumulaTimeTableViewCell.cellId, for: indexPath) as! SumulaTimeTableViewCell
        cell.configure(with: jogador, index: jogador_indice)

        return cell
    }
    
    
}
