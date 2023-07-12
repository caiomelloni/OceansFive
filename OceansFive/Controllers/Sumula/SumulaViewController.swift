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
    let items = ["TimeA", "TimeB", "Pontos", "Informações"]
    let haptic = UISelectionFeedbackGenerator()
    var tableVw = SumulaTimeTableView()
    let pontosVw = SumulaPontosView()
    let infosVw = InfosView(
        infos_vazia
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
        títuloSv()
        tableVw.loadData(segmentedControl.selectedSegmentIndex)
//        funcs.numeroJog()
    }

    override func reloadInputViews() {
        <#code#>
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
                tableVw.loadData(segmentedControl.selectedSegmentIndex)
                insertViewSection(tableVw)
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
                didTapBtnPts(pts: 1, time: &Singleton.shared.sumula.timeA)
            case 1:
                didTapBtnPts(pts: 2, time: &Singleton.shared.sumula.timeA)
            case 2:
                didTapBtnPts(pts: 3, time: &Singleton.shared.sumula.timeA)
            case 3:
                print("\(buttonTag) tapped")
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
                print("\(buttonTag) tapped")
            case 10:
                didTapBtnTempo(time: &Singleton.shared.sumula.timeB)
            case 11:
                print("\(buttonTag) tapped")
            default:
                print("did tap button")
        }
        func didTapBtnPts(pts: Int, time: inout TimeJogando) {
            print(time)
            addButtonTapped(ref: pts, time: &time)
        }
        func didTapBtnFalta() {}
        func didTapBtnTempo(time: inout TimeJogando) {
            addButtonTapped(ref: 4, time: &time)
        }
        func didTapBtnEditar() {}
    }

    func addButtonTapped(ref: Int, time: UnsafeMutablePointer<TimeJogando>) {
        var title: String = ref < 4 ? "Pontuação \(time.pointee.time.abreviado)" : "Tempo \(time.pointee.time.abreviado)"
        var message: String = ref < 4 ? "Adicionar \(ref) ponto(s) ao jogador." : "Informe o tempo atual do jogo."
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addTextField { (textField) in
                textField.placeholder = ref < 4 ? "Digite o número do jogador" : "Tempo de jogo"
            textField.keyboardType = .numberPad
        }
        let okAction = UIAlertAction(title: "Concluir", style: .default) { _ in
          if let numberString = alertController.textFields?.first?.text,
            let number = Int(numberString) {
            // Ação a ser executada quando o botão "Concluir" do alerta modal for pressionado
              switch ref {
                  case 1:
                      Sum().lanceLivre(numeroJogador: number, time: &time.pointee)
                  case 2:
                      Sum().dois(numeroJogador: number, time: &time.pointee)
                  case 3:
                      Sum().tres(numeroJogador: number, time: &time.pointee)
                  case 4:
                      Sum().tempo(tempo: number, time: &time.pointee)
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
