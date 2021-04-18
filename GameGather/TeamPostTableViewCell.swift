//
//  TeamPostTableViewCell.swift
//  GameGather
//
//  Created by Uncia on 4/17/21.
//

import UIKit

class TeamPostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gameImageView: UIImageView!    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
