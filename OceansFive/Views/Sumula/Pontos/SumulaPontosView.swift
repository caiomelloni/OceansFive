//
//  SumulaPontosView.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 05/07/23.
//

import UIKit

class SumulaPontosView: UIView {

    private func viewInicial() -> UIView {
        var vw: UIView = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }

    private func placarLbl(_ text: String) -> UILabel{
        var lbl: UILabel = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 1
        lbl.font = .systemFont(ofSize: 28, weight: .bold)
        lbl.text = "\(text)"
        return lbl
    }

    private func quartoLbl(_ text: String) -> UILabel{
        var lbl: UILabel = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 1
        lbl.font = .systemFont(ofSize: 24, weight: .semibold)
        lbl.text = "\(text)º Quarto"
        return lbl
    }

    private func botaoMenor() {

    }

    private func botaoaMaior() {

    }

    override func layoutSubviews() {
        self.layoutSubviews()
        configurarPlacar()

    }


}


extension SumulaPontosView {
    func configurarPlacar() {
        var timeAbr1: UILabel
        var timeAbr2: UILabel
        var x: UILabel
        var pontosTime1: UILabel
        var pontosTime2: UILabel
        var quarto: UILabel
        var viewPlacar: UIView

        timeAbr1 = placarLbl("TiA")
        timeAbr2 = placarLbl("TiB")
        x = placarLbl("x")
        pontosTime1 = placarLbl("0")
        pontosTime2 = placarLbl("0")
        quarto = quartoLbl("1")
        viewPlacar = viewInicial()

        self.addSubview(viewPlacar)
        viewPlacar.addSubview(timeAbr1)
        viewPlacar.addSubview(timeAbr2)
        viewPlacar.addSubview(timeAbr2)
        viewPlacar.addSubview(x)
        viewPlacar.addSubview(pontosTime1)
        viewPlacar.addSubview(pontosTime2)
        viewPlacar.addSubview(quarto)

        NSLayoutConstraint.activate([
            viewPlacar.topAnchor.constraint(equalTo: self.topAnchor),
            viewPlacar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewPlacar.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            timeAbr1.topAnchor.constraint(equalToSystemSpacingBelow: viewPlacar.topAnchor, multiplier: 2),
            timeAbr1.leadingAnchor.constraint(equalToSystemSpacingAfter: viewPlacar.leadingAnchor, multiplier: 2),

            timeAbr2.topAnchor.constraint(equalTo: timeAbr1.topAnchor),
            timeAbr2.trailingAnchor.constraint(equalToSystemSpacingAfter: viewPlacar.trailingAnchor, multiplier: -2),



        ])


    }
}
