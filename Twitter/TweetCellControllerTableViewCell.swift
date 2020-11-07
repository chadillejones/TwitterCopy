//
//  TweetCellControllerTableViewCell.swift
//  Twitter
//
//  Created by Chadille Jones on 11/6/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
