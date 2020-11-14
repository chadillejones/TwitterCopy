//
//  TweetCellControllerTableViewCell.swift
//  Twitter
//
//  Created by Chadille Jones on 11/6/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func retweetTweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: { self.setRetweeted(true)}, failure: { (error) in
            print("Error in retweeting \(error)")
        })
    }
    
    var favorited:Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false
    
    func setFavorite(_ isFavorited:Bool) {
        favorited=isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
        
    }
    
    func setRetweeted(_ isRetweeted:Bool) {
        retweeted = isRetweeted
        if (isRetweeted) {
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        } else {
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    @IBAction func favTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: { self.setFavorite(true) }, failure: { (error) in
                print("Favorite did not suceed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: { self.setFavorite(false) }, failure: { (error) in
                print("Unfavorite did not suceed: \(error)")
            })
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
