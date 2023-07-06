//
//  TimeTableView.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//

import UIKit

class SumulaTimeTableView: UIView {

    //private lazy var timeViewModel = TimeViewModel()


    private var time: Time = Time(id: UUID(),
                              nome: "",
                              abreviado: "",
                              tecnico: "",
                              jogadores: [Jogador(id: UUID(),
                                                  nome: "",
                                                  pontos: pts,
                                                  faltas: flts)
                              ])

    private lazy var timeTableVw: UITableView = {
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

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    
    
    func loadData(_ index: Int) {
        if index == 0 {
            time = timeA
        } else if index == 1 {
            time = timeB
        }
        timeTableVw.reloadData()
    }
}



extension SumulaTimeTableView {
    func setup() {

        self.translatesAutoresizingMaskIntoConstraints = false
        
        numeroLbl.text = "Número"
        nomeLbl.text = "Nome"
        pontosLbl.text = "Pontos"
        faltasLbl.text = "Faltas"

        timeTableVw.dataSource = self

        self.addSubview(headerVw)
        
        self.addSubview(timeTableVw)

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

            timeTableVw.topAnchor.constraint(equalTo: headerVw.bottomAnchor, constant: 0),
            timeTableVw.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            timeTableVw.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            timeTableVw.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }


}

extension SumulaTimeTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return time.jogadores.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jogador = time.jogadores[indexPath.row]

        let jogador_indice = time.jogadores.firstIndex(where: { $0 == jogador }) as! Int
        //let jogador = timeA_jogadores[0]
        let cell = timeTableVw.dequeueReusableCell(withIdentifier: SumulaTimeTableViewCell.cellId, for: indexPath) as! SumulaTimeTableViewCell
        cell.configure(with: jogador, index: jogador_indice)
        
        return cell
    }
}
