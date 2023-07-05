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
        setup()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        haptic.prepare()

        view.backgroundColor = .systemBackground

        view.addSubview(segmentedControl)

//        view.addSubview(tableVw)
//        tableVw.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ])

//        NSLayoutConstraint.activate(configurarView(tableVw))

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
                view.addSubview(tableVw)
                tableVw.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate(configurarView(tableVw))
                tableVw.loadData(segmentedControl.selectedSegmentIndex)
            case 1:
                view.addSubview(tableVw)
                tableVw.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate(configurarView(tableVw))
                tableVw.loadData(segmentedControl.selectedSegmentIndex)
            case 2:
                tableVw.removeFromSuperview()
                view.addSubview(pontosVw)
                pontosVw.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate(configurarView(pontosVw))

            case 3:
                tableVw.removeFromSuperview()
            default:
                //colorView.backgroundColor = .purple
                tableVw.removeFromSuperview()
        }
    }

}


private extension SumulaViewController {
    func setup() {
        self.navigationController?.navigationBar.topItem?.title = "Preencher Súmula"
    }

    func configurarView(_ view: UIView) -> [NSLayoutConstraint] {
        return [tableVw.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
        view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 1),
        view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 1),
        view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)]
    }


}
