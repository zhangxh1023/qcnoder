//
//  UpsRespModel.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/11/3.
//

import Foundation

public struct UpsRespModel: Codable {
  public let success: Bool?
  
  public let action: String?
  
  enum CodingKeys: String, CodingKey {
    
    case success   = "success"
    case action    = "action"
    
  }
}
