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
    Estatistica(casa: estatisticasCasa["3 pontos"] as! Int, visitante: estatisticasVisitante["3 pontos"] as! Int, legenda: "3 pontos"),
    
    Estatistica(casa: estatisticasCasa["2 pontos"] as! Int, visitante: estatisticasVisitante["2 pontos"] as! Int, legenda: "2 pontos"),
    
    Estatistica(casa: estatisticasCasa["lances livres"] as! Int, visitante: estatisticasVisitante["lances livres"] as! Int, legenda: "lances livres"),
    
    Estatistica(casa: estatisticasCasa["faltas"] as! Int, visitante: estatisticasVisitante["faltas"] as! Int, legenda: "faltas"),
]

//MARK: -Função soma
func somar(num1: Int, num2: Int, num3: Int, num4: Int)->Int {
    return num1 + num2 + num3 + num4
}

//MARK: -Definindo os arrays dos times
    
    //tres pontos
func tresPontosCasa() ->Int {
    let tresPontosPrimeiro = timeJogando1.ponto.tresPontos[0].count
    let tresPontosSegundo = timeJogando1.ponto.tresPontos[1].count
    let tresPontosTerceiro = timeJogando1.ponto.tresPontos[2].count
    let tresPontosQuarto = timeJogando1.ponto.tresPontos[3].count
    
    return somar(num1: tresPontosPrimeiro, num2: tresPontosSegundo, num3: tresPontosTerceiro, num4: tresPontosQuarto)
}

func tresPontosVisitante() ->Int {
    let tresPontosPrimeiro = timeJogando2.ponto.tresPontos[0].count
    let tresPontosSegundo = timeJogando2.ponto.tresPontos[1].count
    let tresPontosTerceiro = timeJogando2.ponto.tresPontos[2].count
    let tresPontosQuarto = timeJogando2.ponto.tresPontos[3].count
    
    return somar(num1: tresPontosPrimeiro, num2: tresPontosSegundo, num3: tresPontosTerceiro, num4: tresPontosQuarto)
}


    //Dois pontos
func doisPontosCasa() ->Int {
    let doisPontosPrimeiro = timeJogando1.ponto.doisPontos[0].count
    let doisPontosSegundo = timeJogando1.ponto.doisPontos[1].count
    let doisPontosTerceiro = timeJogando1.ponto.doisPontos[2].count
    let doisPontosQuarto = timeJogando1.ponto.doisPontos[3].count
    
    return somar(num1: doisPontosPrimeiro, num2: doisPontosSegundo, num3: doisPontosTerceiro, num4: doisPontosQuarto)
}

func doisPontosVisitante() ->Int {
    let doisPontosPrimeiro = timeJogando2.ponto.doisPontos[0].count
    let doisPontosSegundo = timeJogando2.ponto.doisPontos[1].count
    let doisPontosTerceiro = timeJogando2.ponto.doisPontos[2].count
    let doisPontosQuarto = timeJogando2.ponto.doisPontos[3].count
    
    return somar(num1: doisPontosPrimeiro, num2: doisPontosSegundo, num3: doisPontosTerceiro, num4: doisPontosQuarto)
}

    //lances livres
func lanceLivreCasa() ->Int {
    let lanceLivrePrimeiro = timeJogando1.ponto.lanceLivrePonto[0].count
    let lanceLivreSegundo = timeJogando1.ponto.lanceLivrePonto[1].count
    let lanceLivreTerceiro = timeJogando1.ponto.lanceLivrePonto[2].count
    let lanceLivreQuarto = timeJogando1.ponto.lanceLivrePonto[3].count
    
    return somar(num1: lanceLivrePrimeiro, num2: lanceLivreSegundo, num3: lanceLivreTerceiro, num4: lanceLivreQuarto)
}

func lanceLivreVisitante() ->Int {
    let lanceLivrePrimeiro = timeJogando2.ponto.lanceLivrePonto[0].count
    let lanceLivreSegundo = timeJogando2.ponto.lanceLivrePonto[1].count
    let lanceLivreTerceiro = timeJogando2.ponto.lanceLivrePonto[2].count
    let lanceLivreQuarto = timeJogando2.ponto.lanceLivrePonto[3].count
    
    return somar(num1: lanceLivrePrimeiro, num2: lanceLivreSegundo, num3: lanceLivreTerceiro, num4: lanceLivreQuarto)
}
    
    //faltas
func faltasCasa() ->Int {
    let faltasPrimeiro = timeJogando1.faltas[0].count
    let faltasSegundo = timeJogando1.faltas[1].count
    let faltasTerceiro = timeJogando1.faltas[2].count
    let faltasQuarto = timeJogando1.faltas[3].count
    
    return somar(num1: faltasPrimeiro, num2: faltasSegundo, num3: faltasTerceiro, num4: faltasQuarto)
}

func faltasVisitante() ->Int {
    let faltasPrimeiro = timeJogando2.faltas[0].count
    let faltasSegundo = timeJogando2.faltas[1].count
    let faltasTerceiro = timeJogando2.faltas[2].count
    let faltasQuarto = timeJogando2.faltas[3].count
    
    return somar(num1: faltasPrimeiro, num2: faltasSegundo, num3: faltasTerceiro, num4: faltasQuarto)
}

//MARK: -Lógicas

    //Casa:
var estatisticasCasa = [
    "3 pontos": tresPontosCasa(),
    "2 pontos": doisPontosCasa(),
    "lances livres": lanceLivreCasa(),
    "faltas": faltasCasa()
] as [String : Any]
    
    //Visitante:
var estatisticasVisitante = [
    "3 pontos": tresPontosVisitante(),
    "2 pontos": doisPontosVisitante(),
    "lances livres": lanceLivreVisitante(),
    "faltas": faltasVisitante()
] as [String : Any]

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
