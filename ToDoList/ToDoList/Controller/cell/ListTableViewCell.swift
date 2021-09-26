//
//  listTableViewCell.swift
//  ToDoList
//
//  Created by 岡澤輝明 on 2021/09/18.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet public weak var listTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
