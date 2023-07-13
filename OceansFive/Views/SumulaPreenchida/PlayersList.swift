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
]

class PlayersList: UIView  {
    private lazy var tableView: UITableView = {
        let tv = UITableView()
       tv.translatesAutoresizingMaskIntoConstraints = false
       tv.backgroundColor = .clear
       tv.rowHeight = UITableView.automaticDimension
       tv.estimatedRowHeight = 44
       tv.separatorStyle = .singleLine
       return tv
    }()

    
    func configureTableView() {
        setTableViewDelegates()
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalToConstant: frame.width),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jogador = Jogador(id: UUID(), nome: "Segio", pontos: Pontos(), faltas: Faltas(jogoID: UUID(), qtdFaltas: 3))

        let jogador_indice = 5

        let cell = SumulaTimeTableViewCell()
        cell.configure(with: jogador, index: jogador_indice)
        
        return cell
    }
    
    
}
