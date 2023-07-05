//
//  InfosTableView.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 05/07/23.
//

import UIKit

struct Info {
    let imageName: String
    let label: String
    let data: String
}

let infos = [
    Info(imageName: "calendar", label: "Data", data: "Junho 2023 - 06:00 pm"),
    Info(imageName: "mappin.and.ellipse", label: "Local", data: "FEF quadra 1"),
    Info(imageName: "hand.raised.fill", label: "Arbitro", data: "Otavio Mosquita"),
    Info(imageName: "person.fill", label: "Tecnico Flu", data: "Cleiton Fonseca"),
    Info(imageName: "person.fill", label: "Tecnico Fla", data: "Arnaldo Romano"),
    Info(imageName: "exclamationmark.triangle.fill", label: "Faltas Flu", data: "35"),
    Info(imageName: "exclamationmark.triangle.fill", label: "Faltas Fla", data: "23"),
    Info(imageName: "clock.fill", label: "Horario de Termino", data: "8:30 pm"),

]

class InfosView: UIView {
    let tableview: UITableView = {
      let tv = UITableView()
        tv.isScrollEnabled = false
        tv.layer.cornerRadius = CGFloat(20)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .singleLine

        return tv
    }()
    
    override func layoutSubviews() {
       setDelegates()
        setTableLayout()
        tableview.register(InfoTableCell.self, forCellReuseIdentifier: InfoTableCell.cellId)
    }
    
    func setTableLayout() {
        addSubview(tableview)
        
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            tableview.heightAnchor.constraint(equalToConstant: 360),
            tableview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            tableview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
    }
    
    func setDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
}

extension InfosView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = InfoTableCell()
        cell.configure(with: infos[indexPath.row])
        return cell
    }
    
    // table cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
}

class InfoTableCell: UITableViewCell {
    static let cellId = "InfoTableCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let icon: UIView = {
        
        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.layer.cornerRadius = CGFloat(5)
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 30),
            view.widthAnchor.constraint(equalToConstant: 30),
        ])
        
        return view
    }()
    
    func setIcon(_ iconName: String) {
        let imageview = UIImageView(image: UIImage(systemName: iconName))
        imageview.tintColor = .white
        imageview.translatesAutoresizingMaskIntoConstraints = false
        

        icon.addSubview(imageview)
        NSLayoutConstraint.activate([
            imageview.centerXAnchor.constraint(equalTo: icon.centerXAnchor),
            imageview.centerYAnchor.constraint(equalTo: icon.centerYAnchor)
        ])
    }
    
    let labelLeading: UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelTrailing: UILabel = {
      let label = UILabel()
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(with item: Info) {
        labelLeading.text = item.label
        labelTrailing.text = item.data
        setIcon(item.imageName)
    }
    
    func setupViews() {
        addSubview(icon)
        addSubview(labelLeading)
        addSubview(labelTrailing)
        
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            labelLeading.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelLeading.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 8),
            
            labelTrailing.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelTrailing.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
        ])
    }
}
