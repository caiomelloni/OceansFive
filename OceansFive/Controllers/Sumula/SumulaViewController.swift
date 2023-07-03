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

    override func viewDidLoad() {
        super.viewDidLoad()
        haptic.prepare()
        view.backgroundColor = .systemBackground

        view.addSubview(segmentedControl)
        view.addSubview(colorView)
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            segmentedControl.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: segmentedControl.trailingAnchor, multiplier: 2),

            colorView.heightAnchor.constraint(equalToConstant: 200),
            colorView.widthAnchor.constraint(equalToConstant: 200),
            colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
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
