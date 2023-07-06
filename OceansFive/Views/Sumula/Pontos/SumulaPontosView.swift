//
//  SumulaPontosView.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 05/07/23.
//

import UIKit

class SumulaPontosView: UIView {

    private func viewInicial() -> UIView {
        let vw: UIView = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }

    private func placarLbl(_ text: String) -> UILabel{
        let lbl: UILabel = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 28, weight: .semibold)
        lbl.text = "\(text)"
        return lbl
    }

    private func quartoLbl(_ text: String) -> UILabel{
        let lbl: UILabel = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 1
        lbl.font = .systemFont(ofSize: 24, weight: .medium)
        lbl.text = "\(text)º Quarto"
        return lbl
    }

    private func botaoMenor(text: String, image: String) -> UIButton {

        var configuration = UIButton.Configuration.tinted()
        configuration.cornerStyle = .medium
        configuration.buttonSize = .large
        configuration.title = "\(text)"
        configuration.imagePadding = 8
        configuration.image = UIImage(systemName: "\(image)")
        configuration.baseBackgroundColor = PaleteColor.primary15pct

        let btn = UIButton(configuration: configuration, primaryAction: nil)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }

    private func botaoaMaior(text: String, image: String) -> UIButton {
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .medium
        configuration.buttonSize = .large
        configuration.title = "\(text)"
        configuration.imagePadding = 8
        configuration.image = UIImage(systemName: "\(image)")
        //configuration.baseBackgroundColor = PaleteColor.primary15pct

        let btn = UIButton(configuration: configuration, primaryAction: nil)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }


    override func layoutSubviews() {
        super.layoutSubviews()
        //self.translatesAutoresizingMaskIntoConstraints = false
        configurar()
    }


    private lazy var timeAbr1: UILabel = placarLbl("TiA")
    private lazy var timeAbr2: UILabel = placarLbl("TiB")
    private lazy var x: UILabel = placarLbl("x")
    private lazy var pontosTime1: UILabel = placarLbl("0")
    private lazy var pontosTime2: UILabel = placarLbl("0")
    private lazy var quarto: UILabel = quartoLbl("1")
    private lazy var viewPlacar: UIView = viewInicial()
    private lazy var viewBotoes: UIView = viewInicial()
    private lazy var viewBotoesTime1: UIView = viewInicial()
    private lazy var viewBotoesTime2: UIView = viewInicial()
    private lazy var btnControleQuarto: UIView = botaoaMaior(text: "Final de Quarto", image: "clock.fill")
    private lazy var btnLanceLivreTime1: UIButton = botaoMenor(text: "Ponto ", image: "1.square.fill")
    private lazy var btn2PtsTime1: UIButton = botaoMenor(text: "Pontos", image: "2.square.fill")
    private lazy var btn3PtsTime1: UIButton = botaoMenor(text: "Pontos", image: "3.square.fill")
    private lazy var btnFaltasTime1: UIButton = botaoMenor(text: "Faltas ", image: "exclamationmark.square.fill")
    private lazy var btnTempoTime1: UIButton = botaoMenor(text: "Tempo ", image: "pause.fill")
    private lazy var btnEditarTime1: UIButton = botaoMenor(text: "Editar ", image: "eraser.fill")
    private lazy var btnLanceLivreTime2: UIButton = botaoMenor(text: "Ponto ", image: "1.square.fill")
    private lazy var btn2PtsTime2: UIButton = botaoMenor(text: "Pontos", image: "2.square.fill")
    private lazy var btn3PtsTime2: UIButton = botaoMenor(text: "Pontos", image: "3.square.fill")
    private lazy var btnFaltasTime2: UIButton = botaoMenor(text: "Faltas ", image: "exclamationmark.square.fill")
    private lazy var btnTempoTime2: UIButton = botaoMenor(text: "Tempo ", image: "pause.fill")
    private lazy var btnEditarTime2: UIButton = botaoMenor(text: "Editar ", image: "eraser.fill")
}


extension SumulaPontosView {
    func configurar() {

            self.addSubview(viewPlacar)
            viewPlacar.addSubview(timeAbr1)
            viewPlacar.addSubview(timeAbr2)
            viewPlacar.addSubview(x)
            viewPlacar.addSubview(pontosTime1)
            viewPlacar.addSubview(pontosTime2)
            viewPlacar.addSubview(quarto)

            NSLayoutConstraint.activate([
                viewPlacar.topAnchor.constraint(equalTo: self.topAnchor),
                viewPlacar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                viewPlacar.trailingAnchor.constraint(equalTo: self.trailingAnchor),

                x.topAnchor.constraint(equalTo: viewPlacar.topAnchor, constant: 0),
                x.centerXAnchor.constraint(equalTo: viewPlacar.centerXAnchor),

                pontosTime1.topAnchor.constraint(equalTo: x.topAnchor),
                pontosTime1.trailingAnchor.constraint(equalTo: x.leadingAnchor, constant: -16),

                pontosTime2.topAnchor.constraint(equalTo: x.topAnchor),
                pontosTime2.leadingAnchor.constraint(equalTo: x.trailingAnchor, constant: 16),

                timeAbr1.topAnchor.constraint(equalTo: x.topAnchor),
                timeAbr1.trailingAnchor.constraint(equalTo: pontosTime1.leadingAnchor, constant: -16),

                timeAbr2.topAnchor.constraint(equalTo: x.topAnchor),
                timeAbr2.leadingAnchor.constraint(equalTo: pontosTime2.trailingAnchor, constant: 16),

                quarto.centerXAnchor.constraint(equalTo: x.centerXAnchor),
                quarto.topAnchor.constraint(equalTo: x.bottomAnchor),
            ])

        self.addSubview(viewBotoes)
        viewBotoes.addSubview(viewBotoesTime1)
        viewBotoes.addSubview(viewBotoesTime2)
        viewBotoes.addSubview(btnControleQuarto)

        NSLayoutConstraint.activate([
            viewBotoes.topAnchor.constraint(equalTo: quarto.bottomAnchor, constant: 0),
            viewBotoes.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            viewBotoes.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            viewBotoes.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
        ])

        viewBotoesTime1.addSubview(btnLanceLivreTime1)
        viewBotoesTime1.addSubview(btn2PtsTime1)
        viewBotoesTime1.addSubview(btn3PtsTime1)
        viewBotoesTime1.addSubview(btnFaltasTime1)
        viewBotoesTime1.addSubview(btnTempoTime1)
        viewBotoesTime1.addSubview(btnEditarTime1)

            NSLayoutConstraint.activate([
                viewBotoesTime1.widthAnchor.constraint(equalTo: viewBotoes.widthAnchor, multiplier: 0.5),
                viewBotoesTime1.topAnchor.constraint(equalTo: viewBotoes.topAnchor, constant: 0),
                viewBotoesTime1.bottomAnchor.constraint(equalTo: viewBotoes.bottomAnchor, constant: -8),
                viewBotoesTime1.leadingAnchor.constraint(equalTo: viewBotoes.leadingAnchor, constant: 8),

                btnLanceLivreTime1.topAnchor.constraint(equalTo: viewBotoesTime1.topAnchor, constant: 16),
                btnLanceLivreTime1.centerXAnchor.constraint(equalTo: viewBotoesTime1.centerXAnchor),

                btn2PtsTime1.centerXAnchor.constraint(equalTo: viewBotoesTime1.centerXAnchor),
                btn2PtsTime1.topAnchor.constraint(equalTo: btnLanceLivreTime1.bottomAnchor, constant: 16),

                btn3PtsTime1.centerXAnchor.constraint(equalTo: viewBotoesTime1.centerXAnchor),
                btn3PtsTime1.topAnchor.constraint(equalTo: btn2PtsTime1.bottomAnchor, constant: 16),

                btnFaltasTime1.centerXAnchor.constraint(equalTo: viewBotoesTime1.centerXAnchor),
                btnFaltasTime1.topAnchor.constraint(equalTo: btn3PtsTime1.bottomAnchor, constant: 16),

                btnTempoTime1.centerXAnchor.constraint(equalTo: viewBotoesTime1.centerXAnchor),
                btnTempoTime1.topAnchor.constraint(equalTo: btnFaltasTime1.bottomAnchor, constant: 16),

                btnEditarTime1.centerXAnchor.constraint(equalTo: viewBotoesTime1.centerXAnchor),
                btnEditarTime1.topAnchor.constraint(equalTo: btnTempoTime1.bottomAnchor, constant: 16),
            ])

        viewBotoesTime2.addSubview(btnLanceLivreTime2)
        viewBotoesTime2.addSubview(btn2PtsTime2)
        viewBotoesTime2.addSubview(btn3PtsTime2)
        viewBotoesTime2.addSubview(btnFaltasTime2)
        viewBotoesTime2.addSubview(btnTempoTime2)
        viewBotoesTime2.addSubview(btnEditarTime2)

            NSLayoutConstraint.activate([
                viewBotoesTime2.widthAnchor.constraint(equalTo: viewBotoes.widthAnchor, multiplier: 0.5),
                viewBotoesTime2.topAnchor.constraint(equalTo: viewBotoes.topAnchor, constant: 0),
                viewBotoesTime2.bottomAnchor.constraint(equalTo: viewBotoes.bottomAnchor, constant: -8),
                viewBotoesTime2.trailingAnchor.constraint(equalTo: viewBotoes.trailingAnchor, constant: -8),

                btnLanceLivreTime2.topAnchor.constraint(equalTo: viewBotoesTime2.topAnchor, constant: 16),
                btnLanceLivreTime2.centerXAnchor.constraint(equalTo: viewBotoesTime2.centerXAnchor),

                btn2PtsTime2.centerXAnchor.constraint(equalTo: viewBotoesTime2.centerXAnchor),
                btn2PtsTime2.topAnchor.constraint(equalTo: btnLanceLivreTime2.bottomAnchor, constant: 16),

                btn3PtsTime2.centerXAnchor.constraint(equalTo: viewBotoesTime2.centerXAnchor),
                btn3PtsTime2.topAnchor.constraint(equalTo: btn2PtsTime2.bottomAnchor, constant: 16),

                btnFaltasTime2.centerXAnchor.constraint(equalTo: viewBotoesTime2.centerXAnchor),
                btnFaltasTime2.topAnchor.constraint(equalTo: btn3PtsTime2.bottomAnchor, constant: 16),

                btnTempoTime2.centerXAnchor.constraint(equalTo: viewBotoesTime2.centerXAnchor),
                btnTempoTime2.topAnchor.constraint(equalTo: btnFaltasTime2.bottomAnchor, constant: 16),

                btnEditarTime2.centerXAnchor.constraint(equalTo: viewBotoesTime2.centerXAnchor),
                btnEditarTime2.topAnchor.constraint(equalTo: btnTempoTime2.bottomAnchor, constant: 16),
            ])

        NSLayoutConstraint.activate([
            btnControleQuarto.widthAnchor.constraint(equalTo: viewBotoes.widthAnchor, multiplier: 0.8),
            btnControleQuarto.centerXAnchor.constraint(equalTo: viewBotoes.centerXAnchor),
            btnControleQuarto.bottomAnchor.constraint(equalTo: viewBotoes.bottomAnchor, constant: -8)
        ])

        print()
    }
}
