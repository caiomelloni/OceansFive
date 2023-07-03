//
//  TimeTableView.swift
//  OceansFive
//
//  Created by Marcelo Pastana Duarte on 03/07/23.
//

import UIKit

class TimeTableView: UITableView {
    
    private lazy var timeTableVw: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.separatorStyle = .singleLine
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tv
    }()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
}
