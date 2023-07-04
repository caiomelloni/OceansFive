//
//  TimeTableView.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//

import UIKit

class TimeTableView: UIView {

    //private lazy var timeViewModel = TimeViewModel()
    
    private lazy var timeTableVw: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.separatorStyle = .singleLine
        tv.register(TimeTableViewCell.self, forCellReuseIdentifier: TimeTableViewCell.cellId)
        return tv
    }()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
}



extension TimeTableView {
    func setup() {

        timeTableVw.dataSource = self
        //self.view?.addSubview(timeTableVw)
        self.addSubview(timeTableVw)

        NSLayoutConstraint.activate([
            timeTableVw.topAnchor.constraint(equalTo: self.topAnchor),
            timeTableVw.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            timeTableVw.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            timeTableVw.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }


}

extension TimeTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeA.jogadores.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jogador = timeA.jogadores[indexPath.row]

        let jogador_indice = timeA.jogadores.firstIndex(where: { $0 == jogador }) as! Int
        //let jogador = timeA_jogadores[0]
        let cell = timeTableVw.dequeueReusableCell(withIdentifier: TimeTableViewCell.cellId, for: indexPath) as! TimeTableViewCell
        cell.configure(with: jogador, index: jogador_indice)
        return cell
    }
}
