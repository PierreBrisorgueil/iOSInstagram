//
//  post.swift
//  Sample-Swift_instagram
//
//  Created by RYPE on 14/05/2015.
//  Copyright (c) 2015 weareopensource. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Post {
    let comments: Int
    let img: String
    let likes: Int
    let text: String
    
    init(comments: Int, img: String, likes: Int, text: String) {
        self.comments = comments
        self.img = img
        self.likes = likes
        self.text = text
    }
    
    /*************************************************/
    // Functions
    /*************************************************/
    static func postsWithJSON(results: NSArray) -> [Post] {
        var posts = [Post]()
        for postInfo in results {
            
            let json = JSON(postInfo)
            
            if let kind = json["type"].string {
                if kind=="image" {
                    
                    var postimgUrl = json["images"]["standard_resolution"]["url"].string
                    var postComments = json["comments"]["count"].int
                    var postLikes = json["likes"]["count"].int
                    var postText = json["caption"]["text"].string
                    if(postText == nil){
                        postText = "There is no description or Tags for this publication."
                    }
                    
                    var post = Post(comments: postComments!, img: postimgUrl!, likes: postLikes!, text: postText!)
                    posts.append(post)

                }
            }
        }
        return posts
    }
}