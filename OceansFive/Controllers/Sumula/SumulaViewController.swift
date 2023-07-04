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
        view.addTarget(self, action: #selector(changeSelector), for: .valueChanged)
        return view

    }()

    let colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    // MARK: - methods

//    func changeView() {
//        if segmentedControl.selectedSegmentIndex == 0 || segmentedControl.selectedSegmentIndex == 1{
//
//        }
//    }

    override func loadView() {
        super.loadView()
        setup()
    }

    //unc changeView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        haptic.prepare()

        view.backgroundColor = .systemBackground

        view.addSubview(segmentedControl)

        view.addSubview(tableVw)
        tableVw.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            tableVw.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
            tableVw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 1),
            tableVw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 1),
            tableVw.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),


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
            case 1:
                tableVw.loadData(segmentedControl.selectedSegmentIndex)
            case 2:
                colorView.backgroundColor = .cyan
            case 3:
                colorView.backgroundColor = .purple
            default:
                tableVw.loadData(segmentedControl.selectedSegmentIndex)
        }
    }

}


private extension SumulaViewController {
    func setup() {
        self.navigationController?.navigationBar.topItem?.title = "Preencher Súmula"
    }
}
