//
//  SuccessModel.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/11/14.
//

import Foundation

public struct SuccessModel: Codable {
  
  var success : Bool?
  var errorMsg: String?
  
  enum CodingKeys: String, CodingKey {
    
    case success  = "success"
    case errorMsg = "error_msg"
    
  }
  
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    success  = try values.decodeIfPresent(Bool.self    , forKey: .success )
    errorMsg = try values.decodeIfPresent(String.self  , forKey: .errorMsg )
    
  }
  
  public init() {
    
  }
  
}
