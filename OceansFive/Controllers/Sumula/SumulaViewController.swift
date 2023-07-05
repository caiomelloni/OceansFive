//
//  SumulaView.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//

import UIKit

class SumulaViewController: UIViewController {

    // MARK: Properties

    let items = ["TimeA", "TimeB", "Pontos", "Informações"]
    let haptic = UISelectionFeedbackGenerator()
    let tableVw = SumulaTimeTableView()
    let pontosVw = SumulaPontosView()

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

        view.backgroundColor = .systemBackground

        view.addSubview(segmentedControl)
        view.addSubview(tableVw)

        NSLayoutConstraint.activate(configurarView(tableVw))
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
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
                pontosVw.removeFromSuperview()
                tableVw.removeFromSuperview()
                NSLayoutConstraint.activate(configurarView(tableVw))
                tableVw.loadData(segmentedControl.selectedSegmentIndex)

            case 1:
                pontosVw.removeFromSuperview()
                tableVw.removeFromSuperview()
                NSLayoutConstraint.activate(configurarView(tableVw))
                tableVw.loadData(segmentedControl.selectedSegmentIndex)
            case 2:
                pontosVw.removeFromSuperview()
                tableVw.removeFromSuperview()
                NSLayoutConstraint.activate(configurarView(pontosVw))
            case 3:
                pontosVw.removeFromSuperview()
                tableVw.removeFromSuperview()
            default:
                //colorView.backgroundColor = .purple
                tableVw.removeFromSuperview()
        }
    }

}


private extension SumulaViewController {
    func títuloSv() {
        self.navigationController?.navigationBar.topItem?.title = "Preencher Súmula"

    }

    func configurarView(_ vw: UIView) -> [NSLayoutConstraint] {
        view.addSubview(vw)
        vw.translatesAutoresizingMaskIntoConstraints = false
        return [vw.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
                vw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 1),
                vw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 1),
                vw.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)]
    }


}
