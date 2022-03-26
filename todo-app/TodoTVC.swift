//
//  TodoTVC.swift
//  todo-app
//
//  Created by Ergün Yunus Cengiz on 26.03.2022.
//

import UIKit

class TodoTVC: UITableViewCell {
    
    @IBOutlet var labelOfTask: UILabel!
    @IBOutlet var iconOfTask: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
