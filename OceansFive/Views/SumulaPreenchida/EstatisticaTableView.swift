//
//  EstatisticaTableView.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 05/07/23.
//

import UIKit

struct Estatistica {
    let casa: Int
    let visitante: Int
    let legenda: String
}

let estatisticas: [Estatistica] = [
    Estatistica(casa: 7, visitante: 15, legenda: "3 pontos"),
    Estatistica(casa: 25, visitante: 3, legenda: "2 pontos"),
    Estatistica(casa: 8, visitante: 12, legenda: "lances livres"),
    Estatistica(casa: 9, visitante: 4, legenda: "faltas"),
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
        casa.text = String(item.casa)
        visitante.text = String(item.visitante)
        legenda.text = item.legenda
    }
    
    let casa: UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    let visitante: UILabel = {
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

        
        contentView.addSubview(casa)
        contentView.addSubview(visitante)
        contentView.addSubview(legenda)
        
        NSLayoutConstraint.activate([
            casa.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            casa.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            visitante.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            visitante.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            legenda.centerYAnchor.constraint(equalTo: centerYAnchor),
            legenda.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
