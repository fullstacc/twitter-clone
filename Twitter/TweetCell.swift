//
//  TweetCell.swift
//  Twitter
//
//  Created by BRIAN BETANCOURT on 3/6/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    var tweetId:Int = -1
    var favorited:Bool = false
    var retweeted:Bool = false
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBAction func favoriteTweet(_ sender: Any) {
        
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorited did not succeed: \(error)")
            })
        }
    }
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBAction func retweet(_ sender: Any) {
        let toRetweet = !retweeted
        
        if (toRetweet){
            TwitterAPICaller.client?.reTweet(tweetId: tweetId, success: {
                self.setRetweeted(true)
            }, failure: { (error) in
                print("failed to retweet: \(error)")
            })
            
        }
        else {
            TwitterAPICaller.client?.unRetweet(tweetId: tweetId, success: {
                self.setRetweeted(false)
            }, failure: { (error) in
                print("Unretweeted did not succeed: \(error)")
            })
        }
        
        
        
        
    }
    
    
    func setRetweeted(_ isRetweeted:Bool){
        if (isRetweeted){
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else {
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
            
        }
        
    }
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
