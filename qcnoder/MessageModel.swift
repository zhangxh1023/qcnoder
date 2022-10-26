//
//  MessageModel.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/26.
//

import Foundation

public struct MessageModel: Codable {
  var hasReadMessages    : [MessageItemModel]? = []
  var hasnotReadMessages : [MessageItemModel]? = []
  
  enum CodingKeys: String, CodingKey {
    
    case hasReadMessages    = "has_read_messages"
    case hasnotReadMessages = "hasnot_read_messages"
    
  }
  
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    hasReadMessages    = try values.decodeIfPresent([MessageItemModel].self , forKey: .hasReadMessages    )
    hasnotReadMessages = try values.decodeIfPresent([MessageItemModel].self , forKey: .hasnotReadMessages )
    
  }
  
  init() {
    
  }
}

struct MessageItemModel: Codable, Identifiable {
  var id       : String? = nil
  var type     : String? = nil
  var hasRead  : Bool?   = nil
  var author   : AuthorModel? = AuthorModel()
  var topic    : MessageTopic?  = MessageTopic()
  var reply    : MessageReply?  = MessageReply()
  var createAt : String? = nil
  
  enum CodingKeys: String, CodingKey {
    
    case id       = "id"
    case type     = "type"
    case hasRead  = "has_read"
    case author   = "author"
    case topic    = "topic"
    case reply    = "reply"
    case createAt = "create_at"
    
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    id       = try values.decodeIfPresent(String.self , forKey: .id       )
    type     = try values.decodeIfPresent(String.self , forKey: .type     )
    hasRead  = try values.decodeIfPresent(Bool.self   , forKey: .hasRead  )
    author   = try values.decodeIfPresent(AuthorModel.self , forKey: .author   )
    topic    = try values.decodeIfPresent(MessageTopic.self  , forKey: .topic    )
    reply    = try values.decodeIfPresent(MessageReply.self  , forKey: .reply    )
    createAt = try values.decodeIfPresent(String.self , forKey: .createAt )
    
  }
  
  init() {
    
  }
}

struct MessageReply: Codable {
  
  var id       : String?   = nil
  var content  : String?   = nil
  var ups      : [String]? = []
  var createAt : String?   = nil
  
  enum CodingKeys: String, CodingKey {
    
    case id       = "id"
    case content  = "content"
    case ups      = "ups"
    case createAt = "create_at"
    
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    id       = try values.decodeIfPresent(String.self   , forKey: .id       )
    content  = try values.decodeIfPresent(String.self   , forKey: .content  )
    ups      = try values.decodeIfPresent([String].self , forKey: .ups      )
    createAt = try values.decodeIfPresent(String.self   , forKey: .createAt )
    
  }
  
  init() {
    
  }
  
}

struct MessageTopic: Codable {
  
  var id          : String? = nil
  var title       : String? = nil
  var lastReplyAt : String? = nil
  
  enum CodingKeys: String, CodingKey {
    
    case id          = "id"
    case title       = "title"
    case lastReplyAt = "last_reply_at"
    
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    id          = try values.decodeIfPresent(String.self , forKey: .id          )
    title       = try values.decodeIfPresent(String.self , forKey: .title       )
    lastReplyAt = try values.decodeIfPresent(String.self , forKey: .lastReplyAt )
    
  }
  
  init() {
    
  }
  
}
