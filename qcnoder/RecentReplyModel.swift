//
//  RecentReply.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/14.
//

import Foundation

struct RecentReplyModel: Codable {

  var id          : String? = nil
  var author      : AuthorModel? = AuthorModel()
  var title       : String? = nil
  var lastReplyAt : String? = nil

  enum CodingKeys: String, CodingKey {

    case id          = "id"
    case author      = "author"
    case title       = "title"
    case lastReplyAt = "last_reply_at"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id          = try values.decodeIfPresent(String.self , forKey: .id          )
    author      = try values.decodeIfPresent(AuthorModel.self , forKey: .author      )
    title       = try values.decodeIfPresent(String.self , forKey: .title       )
    lastReplyAt = try values.decodeIfPresent(String.self , forKey: .lastReplyAt )
 
  }

  init() {

  }

}
