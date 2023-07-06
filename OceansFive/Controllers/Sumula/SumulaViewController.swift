//
//  SumulaView.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//

import UIKit

class SumulaViewController: UIViewController {

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
                insertViewSection(pontosVw)
            case 3:
                insertViewSection(infosVw)
            default:
                segmentedControl.selectedSegmentIndex = 0

        }
    }

}


private extension SumulaViewController {
    func títuloSv() {
        self.navigationController?.navigationBar.topItem?.title = "Preencher Súmula"
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
