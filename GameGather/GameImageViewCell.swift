//
//  GameImageViewCell.swift
//  GameGather
//
//  Created by Uncia on 4/10/21.
//

import UIKit

class GameImageViewCell: UITableViewCell {
    
    
    @IBOutlet weak var GameImageView: UIImageView!
    @IBOutlet weak var GameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
