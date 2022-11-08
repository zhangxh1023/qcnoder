//
//  ExReplyModel.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/11/8.
//

import Foundation

extension ReplyModel {
  
  public mutating func toggleIsUped(id: String) {
    if let isUped = isUped {
      self.isUped = !isUped
      if self.ups == nil {
        self.ups = []
      }
      if !isUped {
        ups?.append(id)
      } else {
        ups?.removeAll(where: { $0 == id })
      }
    }
  }
  
}
