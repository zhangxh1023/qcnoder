//
//  AuthorModel.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/3.
//

import Foundation

struct AuthorModel: Codable {

  var loginname : String? = nil
  var avatarUrl : String? = nil

  enum CodingKeys: String, CodingKey {

    case loginname = "loginname"
    case avatarUrl = "avatar_url"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    loginname = try values.decodeIfPresent(String.self , forKey: .loginname )
    avatarUrl = try values.decodeIfPresent(String.self , forKey: .avatarUrl )
 
  }

  init() {

  }

}
