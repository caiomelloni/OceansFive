//
//  EstatisticaTableView.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 05/07/23.
//

import UIKit

struct Estatistica {
    let timeA: Int
    let timeB: Int
    let legenda: String
}

var timeAlanceLivre: Int = Sum().contaLanceLivre(time: Singleton.shared.sumula.timeA)
var timeA2pts: Int = Sum().contaDoisPts(time: Singleton.shared.sumula.timeA)
var timeA3pts: Int = Sum().contaTresPts(time: Singleton.shared.sumula.timeA)
var timeAFaltas: Int = Sum().contaFaltas(time: Singleton.shared.sumula.timeA)

var timeBlanceLivre: Int = Sum().contaLanceLivre(time: Singleton.shared.sumula.timeB)
var timeB2pts: Int = Sum().contaDoisPts(time: Singleton.shared.sumula.timeB)
var timeB3pts: Int = Sum().contaTresPts(time: Singleton.shared.sumula.timeB)
var timeBFaltas: Int = Sum().contaFaltas(time: Singleton.shared.sumula.timeB)


let estatisticas: [Estatistica] = [
    Estatistica(timeA: timeAlanceLivre, timeB: timeBlanceLivre, legenda: "3 Pontos"),
    Estatistica(timeA: timeA2pts, timeB: timeB2pts, legenda: "2 Pontos"),
    Estatistica(timeA: timeA3pts, timeB: timeB3pts, legenda: "Lances Livres"),
    Estatistica(timeA: timeAFaltas, timeB: timeBFaltas, legenda: "Faltas"),
]

class EstatisticaTableView: UIView {
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.isScrollEnabled = false
        tv.layer.cornerRadius = CGFloat(20)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .singleLine
        
       return tv
    }()

    
    func configureTableView() {
        setTableViewDelegates()
        
        addSubview(tableView)
        
        tableView.register(EstatisticasTableViewCell.self, forCellReuseIdentifier: "EstatiscaCell")

        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            tableView.heightAnchor.constraint(equalToConstant: 180),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureTableView()
        tableView.reloadData()
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension EstatisticaTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return estatisticas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EstatiscaCell", for: indexPath) as! EstatisticasTableViewCell
        cell.configure(with: estatisticas[indexPath.row])
        return cell
    }
    
    // table cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
}

class EstatisticasTableViewCell: UITableViewCell {
    
    func configure(with item: Estatistica) {
        timeA.text = String(item.timeA)
        timeB.text = String(item.timeB)
        legenda.text = item.legenda
    }
    
    let timeA: UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    let timeB: UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    let legenda: UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {

        
        contentView.addSubview(timeA)
        contentView.addSubview(timeB)
        contentView.addSubview(legenda)
        
        NSLayoutConstraint.activate([
            timeA.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            timeA.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            timeB.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            timeB.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            legenda.centerYAnchor.constraint(equalTo: centerYAnchor),
            legenda.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
