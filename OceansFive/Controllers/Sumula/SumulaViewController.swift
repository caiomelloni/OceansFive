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
    let tableVw = TimeTableView()

    //MARK: UI - Elements
    lazy var segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: items)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
        return view

    }()

    let colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
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
        //view.addSubview(colorView)
        view.addSubview(tableVw)
        tableVw.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
//            segmentedControl.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 8),
//            segmentedControl.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
//            view.trailingAnchor.constraint(equalToSystemSpacingAfter: segmentedControl.trailingAnchor, multiplier: 2),
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            segmentedControl.heightAnchor.constraint(equalToConstant: 100),
            //segmentedControl.bottomAnchor.constraint(equalTo: tableVw.topAnchor, constant: 50),

            tableVw.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
            tableVw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 1),
            tableVw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 1),
            tableVw.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
//            tableVw.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            tableVw.centerYAnchor.constraint(equalTo: view.centerYAnchor),

//            colorView.heightAnchor.constraint(equalToConstant: 200),
//            colorView.widthAnchor.constraint(equalToConstant: 200),
//            colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            colorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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

    @objc func colorChanged() {
        haptic.selectionChanged()
        switch segmentedControl.selectedSegmentIndex {
            case 0:
                colorView.backgroundColor = .blue
            case 1:
                colorView.backgroundColor = .red
            case 2:
                colorView.backgroundColor = .cyan
            case 3:
                colorView.backgroundColor = .purple
            default:
                colorView.backgroundColor = .white
        }
    }

}


private extension SumulaViewController {
    func setup() {
        self.navigationController?.navigationBar.topItem?.title = "Preencher Súmula"
    }
}
