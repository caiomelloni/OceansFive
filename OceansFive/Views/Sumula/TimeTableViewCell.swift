//
//  TimeTableViewCell.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

    static let cellId = "TimeTableViewCell"

    private lazy var rowVw: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()

//    private lazy var contentStackVw: UIStackView = {
//        let stackVw = UIStackView()
//        stackVw.translatesAutoresizingMaskIntoConstraints = false
//        stackVw.axis = .horizontal
//        return stackVw
//    }()

    private lazy var numeroLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 12, weight: .light)
        lbl.textColor = .label
        return lbl
    }()
    private lazy var nomeLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 12, weight: .light)
        lbl.textColor = .label
        return lbl
    }()

    private lazy var pontosLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 12, weight: .light)
        lbl.textColor = .label
        return lbl
    }()

    private lazy var faltasLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 12, weight: .light)
        lbl.textColor = .label
        return lbl
    }()
    override func prepareForReuse() {
        super.prepareForReuse()
        self.jogador = nil

        self.contentView.subviews.forEach { $0.removeFromSuperview() }
    }

    private var jogador: Jogador?



    func configure(with item: Jogador, index: Int ) {


        self.jogador = item

        numeroLbl.text = String(describing: index)
        nomeLbl.text = jogador?.nome
        pontosLbl.text = jogador?.pontos.codingKey.stringValue
        faltasLbl.text = jogador?.faltas.codingKey.stringValue




        self.contentView.addSubview(rowVw)

        rowVw.addSubview(numeroLbl)
        rowVw.addSubview(nomeLbl)
        rowVw.addSubview(pontosLbl)
        rowVw.addSubview(faltasLbl)
        

        NSLayoutConstraint.activate([
            rowVw.heightAnchor.constraint(equalToConstant: 44),
            rowVw.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            rowVw.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),

            numeroLbl.topAnchor.constraint(equalTo: rowVw.topAnchor, constant: 16),
            //numeroLbl.bottomAnchor.constraint(equalTo: rowVw.bottomAnchor, constant: -16),
            numeroLbl.leadingAnchor.constraint(equalTo: rowVw.leadingAnchor, constant: 32),
            //numeroLbl.trailingAnchor.constraint(equalTo: rowVw.trailingAnchor, constant: -8),

            faltasLbl.topAnchor.constraint(equalTo: numeroLbl.topAnchor),
            //faltasLbl.bottomAnchor.constraint(equalTo: numeroLbl.bottomAnchor),
            //faltasLbl.leadingAnchor.constraint(equalTo: pontosLbl.trailingAnchor, constant: 8),
            faltasLbl.trailingAnchor.constraint(equalTo: rowVw.trailingAnchor, constant: -32),

            pontosLbl.topAnchor.constraint(equalTo: numeroLbl.topAnchor),
            pontosLbl.bottomAnchor.constraint(equalTo: numeroLbl.bottomAnchor),
            pontosLbl.trailingAnchor.constraint(equalTo: faltasLbl.leadingAnchor, constant: -32),
//            pontosLbl.leadingAnchor.constraint(equalTo: nomeLbl.trailingAnchor, constant: 16),

            nomeLbl.topAnchor.constraint(equalTo: numeroLbl.topAnchor),
            nomeLbl.bottomAnchor.constraint(equalTo: numeroLbl.bottomAnchor),
            nomeLbl.leadingAnchor.constraint(equalTo: numeroLbl.trailingAnchor, constant: 32),
            //nomeLbl.trailingAnchor.constraint(equalTo: pontosLbl.leadingAnchor, constant: -16),

            //pontosLbl.topAnchor.constraint(equalTo: numeroLbl.topAnchor),
            //pontosLbl.bottomAnchor.constraint(equalTo: numeroLbl.bottomAnchor),
            //pontosLbl.leadingAnchor.constraint(equalTo: nomeLbl.trailingAnchor, constant: 8),
            //nomeLbl.trailingAnchor.constraint(equalTo: rowVw.trailingAnchor, constant: 8),





        ])


    }
}
