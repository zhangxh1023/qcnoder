//
//  TopicRespModel.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/11/3.
//

import Foundation

public struct TopicRespModel: Codable {
  
  public let success: Bool?
  
  public let topicId: String?
  
  enum CodingKeys: String, CodingKey {

    case success   = "success"
    case topicId   = "topic_id"
  
  }
  
}
