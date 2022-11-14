//
//  AccesstokenModel.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/18.
//

import Foundation

public struct VerifyAccesstokenModel: Codable {

  var success   : Bool?   = nil
  var loginname : String? = nil
  var avatarUrl : String? = nil
  var id        : String? = nil
  var errorMsg  : String? = nil

  enum CodingKeys: String, CodingKey {

    case success   = "success"
    case loginname = "loginname"
    case avatarUrl = "avatar_url"
    case id        = "id"
    case errorMsg  = "error_msg"
  
  }

  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    success   = try values.decodeIfPresent(Bool.self   , forKey: .success   )
    loginname = try values.decodeIfPresent(String.self , forKey: .loginname )
    avatarUrl = try values.decodeIfPresent(String.self , forKey: .avatarUrl )
    id        = try values.decodeIfPresent(String.self , forKey: .id        )
    errorMsg  = try values.decodeIfPresent(String.self , forKey: .errorMsg        )
 
  }

  init() {

  }

}
