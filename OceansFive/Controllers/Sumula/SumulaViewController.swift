//
//  SumulaView.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//

import UIKit

protocol SumulaViewDelegate: AnyObject {
    func didTapBtn(_ buttonTag: Int)
}

class SumulaViewController: UIViewController {

    lazy var sumula: Sumula = Sumula(id: UUID(),
                            timeA: TimeJogando(time: timeA,
                                               faltas: [[],[],[],[]],
                                               tempos: [[]],
                                               jogando: [],
                                               ponto: Pontos(lanceLivrePonto: [[],[],[],[]],
                                                             doisPontos: [[],[],[],[]],
                                                             tresPontos: [[],[],[],[]]),
                                                             numeroJogador: [:]),
                            timeB: TimeJogando(time: timeB,
                                               faltas: [[],[],[],[]],
                                               tempos: [[]],
                                               jogando: [],
                                               ponto: Pontos(lanceLivrePonto: [[],[],[],[]],
                                                             doisPontos: [[],[],[],[]],
                                                             tresPontos: [[],[],[],[]]),
                                                             numeroJogador: [:]),
                            campeonato: campeonato_mock,
                            arbitros: ["JuJu"],
                            local: "Boqueirão",
                            horarioInicio: Date(),
                            horarioTermino: Date(),
                            mesa: ["Fausto Silva", "Marcos Mion"])
    var currentView: UIView = UIView()
    // MARK: Properties

    let items = ["TimeA", "TimeB", "Pontos", "Informações"]
    let haptic = UISelectionFeedbackGenerator()
    let tableVw = SumulaTimeTableView()
    let pontosVw = SumulaPontosView()
    let infosVw = InfosView(
        infos_vazia
    )

    //MARK: UI - Elements
    lazy var segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: items)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(changeSelector), for: .valueChanged)
        return view

    }()

    // MARK: - methods



    override func loadView() {
        super.loadView()
        títuloSv()
        tableVw.loadData(segmentedControl.selectedSegmentIndex)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        haptic.prepare()

        currentView = tableVw
        view.backgroundColor = .secondarySystemBackground

        view.addSubview(segmentedControl)

        insertViewSection(currentView)
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            ])

        configNavBarItems()
    }

    private func configNavBarItems() {
        navigationController?.navigationBar.tintColor = PaleteColor.primary
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: nil
        )
    }



    @objc func changeSelector() {

        haptic.selectionChanged()
        switch segmentedControl.selectedSegmentIndex {
            case 0:
                insertViewSection(tableVw)
                tableVw.loadData(segmentedControl.selectedSegmentIndex)
                
            case 1:
                insertViewSection(tableVw)
                tableVw.loadData(segmentedControl.selectedSegmentIndex)
            case 2:
                pontosVw.delegate = self
                insertViewSection(pontosVw)
            case 3:
                insertViewSection(infosVw)
            default:
                segmentedControl.selectedSegmentIndex = 0

        }
    }

}

extension SumulaViewController: SumulaViewDelegate {
    func didTapBtn(_ buttonTag: Int) {
        switch buttonTag {
            case 0:
                didTapBtnPts(pts: 1, time: sumula.timeA)
                print("\(buttonTag) tapped")
                print(sumula.timeA)
            case 1:
                didTapBtnPts(pts: 2, time: sumula.timeA)
                print("\(buttonTag) tapped")
            case 2:
                didTapBtnPts(pts: 3, time: sumula.timeA)
                print("\(buttonTag) tapped")
            case 3:
                print("\(buttonTag) tapped")
            case 4:
                print("\(buttonTag) tapped")
            case 5:
                print("\(buttonTag) tapped")
            case 6:
                didTapBtnPts(pts: 1, time: sumula.timeB)
                print("\(buttonTag) tapped")
            case 7:
                didTapBtnPts(pts: 2, time: sumula.timeB)
                print("\(buttonTag) tapped")
            case 8:
                didTapBtnPts(pts: 3, time: sumula.timeB)
                print("\(buttonTag) tapped")
            case 9:
                print("\(buttonTag) tapped")
            case 10:
                print("\(buttonTag) tapped")
            case 11:
                print("\(buttonTag) tapped")
            default:
                print("did tap button")
        }
        func didTapBtnPts(pts: Int, time: TimeJogando) {
            addButtonTapped(pts: pts, time: time)
        }
        func didTapBtnFalta() {}
        func didTapBtnTempo() {}
        func didTapBtnEditar() {}
    }

    func addButtonTapped(pts: Int, time: TimeJogando) {
        let alertController = UIAlertController(title: "\(time.time.nome)", message: "Adicionar \(pts) ponto(s) ao jogador.", preferredStyle: .alert)
        alertController.addTextField { (textField) in
          textField.placeholder = "Digite o número"
          textField.keyboardType = .phonePad
        }
        let okAction = UIAlertAction(title: "Concluir", style: .default) { (_) in
          if let numberString = alertController.textFields?.first?.text,
            let number = Int(numberString) {
            // Ação a ser executada quando o botão "Concluir" do alerta modal for pressionado
            print("Número digitado: \(number)")
          } else {
            print("Número inválido")
          }
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)

        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
      }

//    let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped)
//)

}


private extension SumulaViewController {
    func títuloSv() {
        self.title = "Preencher Súmula"
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "Jogos"
    }

    func insertViewSection(_ vw: UIView) {
        currentView.removeFromSuperview()
        currentView = vw
        view.addSubview(vw)
        currentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([currentView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
                currentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                currentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                currentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)])
    }

    
}
