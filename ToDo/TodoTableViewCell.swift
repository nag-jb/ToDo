//
//  TodoTableViewCell.swift
//  ToDo
//
//  Created by Sallivan James on 2021/02/21.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.titleLabel.frame = CGRect(x: 0, y: 0, width: 200, height: self.frame.height)
        self.dateLabel.frame = CGRect(x: 250, y: 0, width: self.frame.width - 200, height: self.frame.height) //
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
