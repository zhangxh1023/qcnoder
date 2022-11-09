//
//  ReplyRespModel.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/11/9.
//

import Foundation

public struct ReplyRespModel: Codable {
  
  var success : Bool?   = nil
  var replyId : String? = nil
  
  enum CodingKeys: String, CodingKey {
    
    case success = "success"
    case replyId = "reply_id"
    
  }
  
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    success = try values.decodeIfPresent(Bool.self   , forKey: .success )
    replyId = try values.decodeIfPresent(String.self , forKey: .replyId )
    
  }
  
  public init() {
    
  }
  
}
