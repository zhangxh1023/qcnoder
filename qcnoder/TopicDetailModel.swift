//
//  TopicDetailModel.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/7.
//

import Foundation

public struct TopicDetailModel: Codable {
  
  var id          : String?    = nil
  var authorId    : String?    = nil
  var tab         : String?    = nil
  var content     : String?    = nil
  var title       : String?    = nil
  var lastReplyAt : String?    = nil
  var good        : Bool?      = nil
  var top         : Bool?      = nil
  var replyCount  : Int?       = nil
  var visitCount  : Int?       = nil
  var createAt    : String?    = nil
  var author      : AuthorModel?    = AuthorModel()
  var replies     : [ReplyModel]? = []
  var isCollect   : Bool?      = nil
  
  enum CodingKeys: String, CodingKey {
    
    case id          = "id"
    case authorId    = "author_id"
    case tab         = "tab"
    case content     = "content"
    case title       = "title"
    case lastReplyAt = "last_reply_at"
    case good        = "good"
    case top         = "top"
    case replyCount  = "reply_count"
    case visitCount  = "visit_count"
    case createAt    = "create_at"
    case author      = "author"
    case replies     = "replies"
    case isCollect   = "is_collect"
    
  }
  
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    id          = try values.decodeIfPresent(String.self    , forKey: .id          )
    authorId    = try values.decodeIfPresent(String.self    , forKey: .authorId    )
    tab         = try values.decodeIfPresent(String.self    , forKey: .tab         )
    content     = try values.decodeIfPresent(String.self    , forKey: .content     )
    title       = try values.decodeIfPresent(String.self    , forKey: .title       )
    lastReplyAt = try values.decodeIfPresent(String.self    , forKey: .lastReplyAt )
    good        = try values.decodeIfPresent(Bool.self      , forKey: .good        )
    top         = try values.decodeIfPresent(Bool.self      , forKey: .top         )
    replyCount  = try values.decodeIfPresent(Int.self       , forKey: .replyCount  )
    visitCount  = try values.decodeIfPresent(Int.self       , forKey: .visitCount  )
    createAt    = try values.decodeIfPresent(String.self    , forKey: .createAt    )
    author      = try values.decodeIfPresent(AuthorModel.self    , forKey: .author      )
    replies     = try values.decodeIfPresent([ReplyModel].self , forKey: .replies     )
    isCollect   = try values.decodeIfPresent(Bool.self      , forKey: .isCollect   )
    
  }
  
  public init(id: String?) {
    self.id = id
  }
  
  init() {
    
  }
  
}
