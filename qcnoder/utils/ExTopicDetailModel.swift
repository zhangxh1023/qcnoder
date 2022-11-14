//
//  ExTopicDetailModel.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/11/14.
//

import Foundation

extension TopicDetailModel {
  
  public mutating func toggleIsCollect() {
    if let isCollect = isCollect {
      self.isCollect = !isCollect
    }
  }
  
}
