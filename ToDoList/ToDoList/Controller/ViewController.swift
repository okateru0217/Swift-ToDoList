//
//  ViewController.swift
//  ToDoList
//
//  Created by 岡澤輝明 on 2021/09/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    private var list = ["リスト１", "リスト２", "リスト３"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.delegate = self
        listTableView.dataSource = self
        tableViewRegister()
        tableViewFooterCellConfig()
        tableViewBackgroundConfig()
    }
    
    // 「+」ボタンがあるCellの下の余白を押した時の処理
    func tableViewBackgroundConfig() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tableTapped))
        self.listTableView.backgroundView = UIView()
        self.listTableView.backgroundView?.addGestureRecognizer(tap)
    }

    @objc func tableTapped(_ sender: UITapGestureRecognizer) {
        list.append("")
        listTableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListTableViewCell
        cell.listTextField.delegate = self
        cell.listTextField.text = list[indexPath.row]
        guard cell.listTextField.text?.count != 0 else {
            cell.listTextField.becomeFirstResponder()
            return cell
        }
        return cell
    }
    
    func tableViewRegister() {
        listTableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "listCell")
    }
    
    // 「+」ボタンの設定
    func tableViewFooterCellConfig() {
        let footerCell: UITableViewCell = listTableView.dequeueReusableCell(withIdentifier: "addListButtonCell")!
        let footerView: UIView = footerCell.contentView
        self.listTableView.tableFooterView = footerView

        // 「+」ボタン押下時の処理
        let tap = UITapGestureRecognizer(target: self, action: #selector(tableTapped))
        self.listTableView.tableFooterView?.addGestureRecognizer(tap)
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        list.removeLast()
        if textField.text!.count > 0 {
            list.append(textField.text!)
        }
        listTableView.reloadData()
        textField.resignFirstResponder()
        return true
    }
}
