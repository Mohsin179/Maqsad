//
//  DisplayViewController.swift
//  Maqsad-Test-App
//
//  Created by Mohsin Hassan on 04/10/2022.
//

import UIKit

class DisplayViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var data: [Items]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         prepareView()
    }
}

// MARK: - View related
extension DisplayViewController {
    func prepareView() {
        prepareDelegates()
        prepareTableView()
    }
    
}

// MARK: - Helper Functions
private extension DisplayViewController {
    func prepareDelegates() {
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    func prepareTableView() {
        tblView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        registerCells()
        setFooterView()
    }
    
    
    func registerCells() {
        tblView.register(DisplayTableViewCell.nib,
                         forCellReuseIdentifier: DisplayTableViewCell.identifier)
    }
    
    func setFooterView() {
        let view = UIView.init()
        self.tblView.tableFooterView = view
    }
}

// MARK: - Tableview Datasource
extension DisplayViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblView.dequeueReusableCell(
            withIdentifier: DisplayTableViewCell.identifier, for: indexPath
        ) as? DisplayTableViewCell else {
            return UITableViewCell()
        }
        let data = data?[indexPath.row]
        cell.bindData(data: data)
        return cell
    }
}


