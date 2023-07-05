//
//  TimeTableViewCell.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//

import UIKit

class SumulaTimeTableViewCell: UITableViewCell {

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


    private lazy var numeroLbl: UILabel = cellLbl()
    private lazy var nomeLbl: UILabel = cellLbl()
    private lazy var pontosLbl: UILabel = cellLbl()
    private lazy var faltasLbl: UILabel = cellLbl()

    private func cellLbl() -> UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 14, weight: .light)
        lbl.textColor = .label
        return lbl
    }


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
            numeroLbl.leadingAnchor.constraint(equalTo: rowVw.leadingAnchor, constant: 56),

            faltasLbl.topAnchor.constraint(equalTo: numeroLbl.topAnchor),
            faltasLbl.trailingAnchor.constraint(equalTo: rowVw.trailingAnchor, constant: -48),

            pontosLbl.topAnchor.constraint(equalTo: numeroLbl.topAnchor),
            pontosLbl.bottomAnchor.constraint(equalTo: numeroLbl.bottomAnchor),
            pontosLbl.trailingAnchor.constraint(equalTo: faltasLbl.leadingAnchor, constant: -64),

            nomeLbl.topAnchor.constraint(equalTo: numeroLbl.topAnchor),
            nomeLbl.bottomAnchor.constraint(equalTo: numeroLbl.bottomAnchor),
            nomeLbl.leadingAnchor.constraint(equalTo: numeroLbl.trailingAnchor, constant: 64),
        ])
    }
}