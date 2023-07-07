//
//  ExplorarViewController.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 28/06/23.
//

import UIKit

class ExplorarViewController: UIViewController {
    
    private lazy var tablevw : UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.separatorStyle = .none
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.register(CampeonatoTableViewCell.self, forCellReuseIdentifier: CampeonatoTableViewCell.Cellid)
        return tv
        }()



override func loadView() {
    super.loadView()
    setup()
    
}
override func viewDidLoad() {
        super.viewDidLoad()
    tablevw.delegate = self
    tablevw.dataSource = self
    
    //self.navigationController?.navigationBar.topItem?.title = "Explorar"
    self.title = "Explorar"
    self.navigationController?.navigationBar.prefersLargeTitles = true
    view.backgroundColor = .secondarySystemBackground
//    self.view.backgroundColor = .blue
    }
}

extension ExplorarViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablevw.dequeueReusableCell(withIdentifier: CampeonatoTableViewCell.Cellid, for: indexPath) as! CampeonatoTableViewCell
        cell.configure()
        cell.setOnClickListener {
            let newViewController = CampeonatoViewController()
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 126   }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 10.0
//    }
    
    
    func setup() {
        tablevw.dataSource = self
        self.view.addSubview(tablevw)
//        tablevw.backgroundColor = .cyan
        NSLayoutConstraint.activate([
            tablevw.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tablevw.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tablevw.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tablevw.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)])
    }
    
}







