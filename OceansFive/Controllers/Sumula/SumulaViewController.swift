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


    var currentView: UIView = UIView()
    // MARK: Properties
    var funcs = Sum()
    let items = ["Pontos", "Informações", "TimeA", "TimeB"]
    let haptic = UISelectionFeedbackGenerator()
    var tableVw = SumulaTimeTableView()
    let pontosVw = SumulaPontosView()
   // let infos = InfosSumulaJogando()
    var infosVw = InfosView(
        InfosSumulaJogando().infos_vazia
    )
//    let funcs = Sum()

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
        funcs.numeroJog(time: &Singleton.shared.sumula.timeA)
        funcs.numeroJog(time: &Singleton.shared.sumula.timeB)
        print("Singleton.shared.sumula.periodo \(Singleton.shared.sumula.periodo)")
        títuloSv()
        tableVw.loadData(segmentedControl.selectedSegmentIndex)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        haptic.prepare()

        currentView = pontosVw

        view.backgroundColor = .secondarySystemBackground

        view.addSubview(segmentedControl)
        pontosVw.delegate = self
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
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .add,
//            target: self,
//            action: nil
//        )
    }



    @objc func changeSelector() {

        haptic.selectionChanged()
        switch segmentedControl.selectedSegmentIndex {

            case 0:
                pontosVw.delegate = self
                insertViewSection(pontosVw)
            case 1:
                infosVw = InfosView(InfosSumulaJogando().infos_vazia)
                insertViewSection(infosVw)
            case 2:
                tableVw.loadData(segmentedControl.selectedSegmentIndex)
                insertViewSection(tableVw)
            case 3:
                insertViewSection(tableVw)
                tableVw.loadData(segmentedControl.selectedSegmentIndex)
            default:
                segmentedControl.selectedSegmentIndex = 0

        }
    }

}

extension SumulaViewController: SumulaViewDelegate {
    func didTapBtn(_ buttonTag: Int) {
        if Singleton.shared.sumula.horarioInicio != nil && Singleton.shared.sumula.horarioTermino == nil {
            switch buttonTag {
                case 0:
                    didTapBtnPts(pts: 1, time: &Singleton.shared.sumula.timeA)
                case 1:
                    didTapBtnPts(pts: 2, time: &Singleton.shared.sumula.timeA)
                case 2:
                    didTapBtnPts(pts: 3, time: &Singleton.shared.sumula.timeA)
                case 3:
                    didTapBtnFalta(time: &Singleton.shared.sumula.timeA)
                case 4:
                    didTapBtnTempo(time: &Singleton.shared.sumula.timeA)
                case 5:
                    print("\(buttonTag) tapped")
                case 6:
                    didTapBtnPts(pts: 1, time: &Singleton.shared.sumula.timeB)
                case 7:
                    didTapBtnPts(pts: 2, time: &Singleton.shared.sumula.timeB)
                case 8:
                    didTapBtnPts(pts: 3, time: &Singleton.shared.sumula.timeB)
                case 9:
                    didTapBtnFalta(time: &Singleton.shared.sumula.timeB)
                case 10:
                    didTapBtnTempo(time: &Singleton.shared.sumula.timeB)
                case 11:
                    print("\(buttonTag) tapped")
                default:
                    print("did tap button")
            }
        }
        func didTapBtnPts(pts: Int, time: inout TimeJogando) {
            addButtonTapped(ref: pts, time: &time)
        }
        func didTapBtnFalta(time: inout TimeJogando) {
            addButtonTapped(ref: 5, time: &time)
        }
        func didTapBtnTempo(time: inout TimeJogando) {
            addButtonTapped(ref: 4, time: &time)
        }
        func didTapBtnEditar() {}
    }

    func addButtonTapped(ref: Int, time: UnsafeMutablePointer<TimeJogando>) {
        let title: String
        let message: String
        if ref < 4 {
            title = "Pontuação \(time.pointee.time.abreviado)"
            message = "Adicionar \(ref) ponto(s) ao jogador."
        } else if ref == 4 {
            title = "Tempo \(time.pointee.time.abreviado)"
            message = "Informe o tempo atual do jogo."
        } else {
            title = "Falta \(time.pointee.time.abreviado)"
            message = "Adicionar falta ao jogador."
        }
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addTextField { (textField) in
                textField.placeholder = ref == 4 ? "Tempo de jogo" : "Digite o número do jogador"
                textField.keyboardType = .numberPad
        }
        let okAction = UIAlertAction(title: "Concluir", style: .default) { _ in
          if let numberString = alertController.textFields?.first?.text,
            let number = Int(numberString) {
            // Ação a ser executada quando o botão "Concluir" do alerta modal for pressionado
              switch ref {
                  case 1:
                      Sum().lanceLivre(numeroJogador: number, time: &time.pointee)
                      self.pontosVw.atualizaPlacar()
                  case 2:
                      Sum().dois(numeroJogador: number, time: &time.pointee)
                      self.pontosVw.atualizaPlacar()
                  case 3:
                      Sum().tres(numeroJogador: number, time: &time.pointee)
                      self.pontosVw.atualizaPlacar()
                  case 4:
                      Sum().tempo(tempo: number, time: &time.pointee)
                  case 5:
                      Sum().faltas(numeroJogador: number, time: &time.pointee)
                  default:
                      break
              }
          } else {
            print("Número inválido")
          }
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)

        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
      }

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
