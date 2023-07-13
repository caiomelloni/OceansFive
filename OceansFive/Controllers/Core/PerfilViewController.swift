//  PerfilViewController.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 28/06/23.
//

import UIKit

class PerfilViewController: UIViewController {
    @objc func editButtonTapped() {
        // Implemente a lógica para lidar com o toque do botão "Editar"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "Perfil"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "edit", style: .done, target: self, action: nil)
        
        imgvw = buildImage()
        
        view.addSubview(imgvw)
        NSLayoutConstraint.activate([
            imgvw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:66),
            imgvw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -66),
            imgvw.topAnchor.constraint(equalTo: view.topAnchor),
            imgvw.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    var imgvw: UIImageView = UIImageView()
        func buildImage() -> UIImageView {
            let imgvw = UIImageView()
            imgvw.translatesAutoresizingMaskIntoConstraints = false
            imgvw.contentMode = .scaleAspectFit
            imgvw.layer.cornerRadius = 10.0
            imgvw.clipsToBounds = true
            imgvw.image = UIImage(named: "alert")
            return imgvw
        }
        
        
        
        
        
        }
    

