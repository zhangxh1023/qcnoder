//
//  UserModel.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/14.
//

import Foundation

public struct UserModel: Codable {

  var loginname      : String?          = nil
  var avatarUrl      : String?          = nil
  var githubUsername : String?          = nil
  var createAt       : String?          = nil
  var score          : Int?             = nil
  var recentTopics   : [RecentReplyModel]?  = []
  var recentReplies  : [RecentReplyModel]? = []

  enum CodingKeys: String, CodingKey {

    case loginname      = "loginname"
    case avatarUrl      = "avatar_url"
    case githubUsername = "githubUsername"
    case createAt       = "create_at"
    case score          = "score"
    case recentTopics   = "recent_topics"
    case recentReplies  = "recent_replies"
  
  }

  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    loginname      = try values.decodeIfPresent(String.self          , forKey: .loginname      )
    avatarUrl      = try values.decodeIfPresent(String.self          , forKey: .avatarUrl      )
    githubUsername = try values.decodeIfPresent(String.self          , forKey: .githubUsername )
    createAt       = try values.decodeIfPresent(String.self          , forKey: .createAt       )
    score          = try values.decodeIfPresent(Int.self             , forKey: .score          )
    recentTopics   = try values.decodeIfPresent([RecentReplyModel].self  , forKey: .recentTopics   )
    recentReplies  = try values.decodeIfPresent([RecentReplyModel].self , forKey: .recentReplies  )
 
  }

  init() {

  }

}
