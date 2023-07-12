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
                print("\(buttonTag) tapped")
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
                print("\(buttonTag) tapped")
            case 11:
                print("\(buttonTag) tapped")
            default:
                print("did tap button")
        }
        func didTapBtnPts(pts: Int, time: inout TimeJogando) {
            //print(time)
            withUnsafePointer(to: time) { pointer in
                print("Dentro do tap :\(pointer)")
            }

            addButtonTapped(pts: pts, time: &time)
        }
        func didTapBtnFalta() {
            
            
        }
        func didTapBtnTempo() {}
        func didTapBtnEditar() {}
    }

//    func addButtonTapped(pts: Int, time: TimeJogando) {
    func addButtonTapped(pts: Int, time: UnsafeMutablePointer<TimeJogando>) {
        let alertController = UIAlertController(title: "Teste", message: "Adicionar \(pts) ponto(s) ao jogador.", preferredStyle: .alert)
        alertController.addTextField { (textField) in
          textField.placeholder = "Digite o número"
          textField.keyboardType = .phonePad
        }
        let okAction = UIAlertAction(title: "Concluir", style: .default) { _ in
          if let numberString = alertController.textFields?.first?.text,
            let number = Int(numberString) {
            // Ação a ser executada quando o botão "Concluir" do alerta modal for pressionado
              switch pts {
                  case 1:
                      Sum().lanceLivre(numeroJogador: number, time: &time.pointee)
                  self.pontosVw.setNeedsDisplay()
                  case 2:
                      Sum().dois(numeroJogador: number, time: &time.pointee)
                  self.pontosVw.setNeedsDisplay()
                  case 3:
                      withUnsafePointer(to: time) { pointer in
                          print("Dentro do switch :\(pointer)")
                      }

                      Sum().tres(numeroJogador: number, time: &time.pointee)
                  self.pontosVw.setNeedsDisplay()
                      

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
