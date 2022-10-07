//
//  ReplyModel.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/7.
//

import Foundation

public struct ReplyModel: Decodable {
  
  var id       : String?   = nil
  var author   : AuthorModel? = AuthorModel()
  var content  : String?   = nil
  var ups      : [String]? = []
  var createAt : String?   = nil
  var replyId  : String?   = nil
  var isUped   : Bool?     = nil
  
  enum CodingKeys: String, CodingKey {
    
    case id       = "id"
    case author   = "author"
    case content  = "content"
    case ups      = "ups"
    case createAt = "create_at"
    case replyId  = "reply_id"
    case isUped   = "is_uped"
    
  }
  
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    id       = try values.decodeIfPresent(String.self   , forKey: .id       )
    author   = try values.decodeIfPresent(AuthorModel.self, forKey: .author   )
    content  = try values.decodeIfPresent(String.self   , forKey: .content  )
    ups      = try values.decodeIfPresent([String].self , forKey: .ups      )
    createAt = try values.decodeIfPresent(String.self   , forKey: .createAt )
    replyId  = try values.decodeIfPresent(String.self   , forKey: .replyId  )
    isUped   = try values.decodeIfPresent(Bool.self     , forKey: .isUped   )
    
  }
  
  init() {
    
  }
  
}
