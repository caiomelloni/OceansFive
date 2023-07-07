//
//  ViewController.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 06/07/23.
//

import UIKit

class ViewController: UIViewController {

    var ptsVw = SumulaPontosView()

    override func viewDidLoad() {
        super.viewDidLoad()
        ptsVw.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ptsVw)

        NSLayoutConstraint.activate([
            ptsVw.topAnchor.constraint(equalTo: view.topAnchor),
            ptsVw.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ptsVw.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ptsVw.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
