//
//  InfosTableView.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 05/07/23.
//

import UIKit

struct Info {
    let icon: UIView
    let leading: String
    let trailing: String
}

let infos = [
    Info(icon: SFSymbolIcon.view("calendar"), leading: "Data", trailing: "Junho 2023 - 06:00 pm"),
    Info(icon: SFSymbolIcon.view("mappin.and.ellipse"), leading: "Local", trailing: "FEF quadra 1"),
    Info(icon: SFSymbolIcon.view("hand.raised.fill"), leading: "Arbitro", trailing: "Otavio Mosquita"),
    Info(icon: SFSymbolIcon.view("person.fill"), leading: "Tecnico Flu", trailing: "Cleiton Fonseca"),
    Info(icon: SFSymbolIcon.view("person.fill"), leading: "Tecnico Fla", trailing: "Arnaldo Romano"),
    Info(icon: SFSymbolIcon.view("exclamationmark.triangle.fill"), leading: "Faltas Flu", trailing: "35"),
    Info(icon: SFSymbolIcon.view("exclamationmark.triangle.fill"), leading: "Faltas Fla", trailing: "23"),
    Info(icon: SFSymbolIcon.view("clock.fill"), leading: "Horario de Termino", trailing: "8:30 pm"),
]

let tabelaClassificacao: [Info] = [
    Info(icon: NumberIcon.view("1"), leading: "CEM", trailing: "9 pts"),
    Info(icon: NumberIcon.view("2"), leading: "LEU", trailing: "6 pts"),
    Info(icon: NumberIcon.view("3"), leading: "LAU", trailing: "4 pts"),
    Info(icon: NumberIcon.view("4"), leading: "LCN", trailing: "3 pts"),
    Info(icon: NumberIcon.view("5"), leading: "LMN", trailing: "1 pts"),
    Info(icon: NumberIcon.view("6"), leading: "LTR", trailing: "0 pts"),
    Info(icon: NumberIcon.view("7"), leading: "LHE", trailing: "0 pts"),
    Info(icon: NumberIcon.view("8"), leading: "VLA", trailing: "0 pts"),

]

class InfosView: UIView {
   
    private var tableData: [Info] = []
    
    init(_ tableData: [Info]) {
        self.tableData = tableData
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableview: UITableView = {
      let tv = UITableView()
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
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = InfoTableCell()
        cell.configure(with: tableData[indexPath.row])
        return cell
    }
    
    // table cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
}

class InfoTableCell: UITableViewCell {
    static let cellId = "InfoTableCell"
    
    var icon: UIView = {
        let view = UIView()
        return view
    }()
    
    func setIcon(_ icon: UIView) {
        self.icon = icon
        self.icon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.icon.heightAnchor.constraint(equalToConstant: 30),
            self.icon.widthAnchor.constraint(equalToConstant: 30),
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
        labelLeading.text = item.leading
        labelTrailing.text = item.trailing
        setIcon(item.icon)
        setupViews()
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

class SFSymbolIcon {
    static func view(_ imageName: String, isActive: Bool = false) -> UIView {
        let icon: UIView = {
            
            let view = UIView()

            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = isActive ? PaleteColor.primary : .gray
            view.layer.cornerRadius = CGFloat(5)
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 30),
                view.widthAnchor.constraint(equalToConstant: 30),
            ])
            
            return view
        }()
       
        let imageview = UIImageView(image: UIImage(systemName: imageName))
        imageview.tintColor = .white
        imageview.translatesAutoresizingMaskIntoConstraints = false
        

        icon.addSubview(imageview)
        NSLayoutConstraint.activate([
            imageview.centerXAnchor.constraint(equalTo: icon.centerXAnchor),
            imageview.centerYAnchor.constraint(equalTo: icon.centerYAnchor)
        ])
        
        return icon
    }
}

class NumberIcon {
    static func view(_ number: String, isActive: Bool = false) -> UIView {
        let icon: UIView = {
            
            let view = UIView()

            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = isActive ? PaleteColor.primary : .gray
            view.layer.cornerRadius = CGFloat(5)
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 30),
                view.widthAnchor.constraint(equalToConstant: 30),
            ])
            
            return view
        }()
       
        let numberview = UILabel()
        numberview.text = number
        numberview.textColor = .white
        numberview.translatesAutoresizingMaskIntoConstraints = false
        

        icon.addSubview(numberview)
        NSLayoutConstraint.activate([
            numberview.centerXAnchor.constraint(equalTo: icon.centerXAnchor),
            numberview.centerYAnchor.constraint(equalTo: icon.centerYAnchor)
        ])
        
        return icon
    }
}
