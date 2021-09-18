//
//  ViewController.swift
//  ToDoList
//
//  Created by 岡澤輝明 on 2021/09/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    private let task = [2, 2, 2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
        tableViewRegister()
        tableViewFooterCellConfig()
    }

    @objc func tableTapped(_ sender: UITapGestureRecognizer) {
        print("test")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! listTableViewCell
        return cell
    }
    
    func tableViewRegister() {
        listTableView.register(UINib(nibName: "listTableViewCell", bundle: nil), forCellReuseIdentifier: "listCell")
    }
    
    func tableViewFooterCellConfig() {
        let footerCell: UITableViewCell = listTableView.dequeueReusableCell(withIdentifier: "addListButtonCell")!
        let footerView: UIView = footerCell.contentView
        listTableView.tableFooterView = footerView
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tableTapped))
        self.listTableView.tableFooterView?.addGestureRecognizer(tap)
    }
    
}
